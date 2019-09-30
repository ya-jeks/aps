defmodule PlanBuilder do

  def call(ids, intervals) do
    %Postgrex.Result{rows: rows, columns: columns} = Ecto.Adapters.SQL.query!(Menu.Repo, magic_query(ids), [])

    list = make_map(rows, columns)
    %{
      required: required,
      available: available,
      constraint: _constraint,
      order: [limited_res|_] = order
    } = ConstraintCalc.call(list, intervals)

    top = Enum.filter(list, fn(l)-> l.parent_uid == nil end)
    {planned, skipped, free_intervals} =
      Enum.map(top, &make_tree(&1, list) )
      |> Enum.sort_by( & &1.demand_id )
      |> Planner.Demands.call(order, intervals)

    plan = %Menu.Plan{
      planned: flatten_trees(planned),
      skipped: (flatten_trees(skipped) |> Enum.filter(fn(l)-> l.parent_uid == nil end)),
      required: required,
      available: available,
      intervals: intervals,
      free: free_intervals,
      order: order
    }

    {:ok, plan}
  end

  def time_on_res(demand, res) do
    flatten_tree(demand, [])
    |> List.flatten
    |> Enum.filter(fn(l)-> l.kind == res end)
    |> Enum.reduce(0, fn(l, acc)-> l.duration+acc end)
  end

  def make_map(rows, columns) do
    Enum.map(rows,
      fn(row)-> Enum.zip(columns, row) |>
                Enum.map(fn({k,v})-> {String.to_atom(k), v} end) |>
                Enum.into(%{})
      end)
  end

  def make_tree(task, rows) do
    subtasks =
      Enum.filter(rows, fn(row)-> row.parent_uid == task.uid end) |>
      Enum.map(fn(st)-> make_tree(st, rows) end)
    Map.merge(task, %{subtasks: subtasks})
  end

  def flatten_trees(trees) do
    Enum.map(trees, fn(t)-> flatten_tree(t, []) end) |>
    List.flatten |>
    Enum.sort_by(fn(t)->
      st = case t[:start] do
        nil -> 0
        start -> start
      end
      [t.kind, st]
    end)
  end
  def flatten_tree(%{subtasks: []} = tree, list), do: [Map.drop(tree, [:subtasks, :earliest])|list]
  def flatten_tree(%{subtasks: subtasks} = tree, list) do
    [Map.drop(tree, [:subtasks, :earliest])|Enum.map(subtasks, fn(s)-> flatten_tree(s, list) end)]
  end

  def magic_product_query(product_id, price, qty) do
    """
with recursive tasks as (
	select  uuid_generate_v4()::varchar as uid,
		null::varchar as parent_uid,
		p.id as product_id,
		p.title,
		#{price} as price,
		#{qty} as qty,
		p.kind,
		p.duration*#{qty} as duration
	from products p
  where p.id = #{product_id}
	union all
	select  uuid_generate_v4()::varchar as uid,
		t.uid as parent_uid,
		p.id as product_id,
		p.title,
		p.price,
		t.qty,
		p.kind,
		p.duration*t.qty
	from tasks t
	join product_parts pp on t.product_id = pp.product_id
	join products p on p.id = pp.part_id
)
select * from tasks order by title;
    """ |> String.replace(~r/\r|\n/, " ")
  end

  def magic_query(demand_ids) do
    """
with recursive tasks as (
	select  d.id as demand_id,
    d.id::varchar as uid,
		null::varchar as parent_uid,
		d.product_id,
		p.title,
		d.price,
		d.qty,
		p.kind,
		p.duration*d.qty as duration
	from demands d
	join products p on p.id = d.product_id
	where d.id in (#{demand_ids})
	union all
	select  demand_id,
    uuid_generate_v4()::varchar as uid,
		t.uid as parent_uid,
		p.id as product_id,
		p.title,
		p.price,
		t.qty,
		p.kind,
		p.duration*t.qty
	from tasks t
	join product_parts pp on t.product_id = pp.product_id
	join products p on p.id = pp.part_id
)
select * from tasks order by demand_id;
    """ |> String.replace(~r/\r|\n/, " ")
  end
end
