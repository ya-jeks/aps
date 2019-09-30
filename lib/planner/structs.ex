defmodule Planner.Structs do

  def call(product_ids) do
    %Postgrex.Result{rows: rows, columns: columns} = records(product_ids)
    rows |>
    Enum.map(fn(row)->
      Enum.zip(columns, row) |>
      Enum.into(%{})
    end)
  end

  defp records(ids) do
    ids = Enum.join(ids, ",")
    Ecto.Adapters.SQL.query!(Menu.Repo, query(ids), [])
  end

  defp query(ids) do
    """
with recursive structs as (
	select null::integer as parent_id,
		p.id,
		p.title,
		p.kind,
		p.duration as duration
	from products p
  where p.id in (#{ids})
	union
	select s.id as parent_id,
		p.id,
		p.title,
		p.kind,
		p.duration
	from structs s
	join product_parts pp on s.id = pp.product_id
	join products p on p.id = pp.part_id
)
select * from structs;
    """ |> String.replace(~r/\r|\n/, " ")
  end

end