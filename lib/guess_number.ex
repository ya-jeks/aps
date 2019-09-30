defmodule GuessNumber do

  def call(min..max = range, demand, order, intervals) when min == (max-1), do: min
  def call(min..max = range, demand, order, intervals) when min < max do
    IO.inspect [:call, min, max, demand.qty]
    middle = min + Integer.floor_div((max-min), 2)
    dm = rebuild_qty(demand, middle)

    case fits?(dm, order, intervals) do
      {:ok, _planned} ->
        IO.inspect ["gt", middle, max]
        call(middle..max, dm, order, intervals)
      {:error, false} ->
        IO.inspect ["lt", min, middle]
        call(min..middle, dm, order, intervals)
    end
  end

  def fits?(demand, order, intervals) do
    case Planner.Demands.call([demand], order, intervals) do
      {[], [demand], intervals} ->
        IO.inspect ["no", demand.qty]
        {:error, false}
      {planned, [], _} ->
        IO.inspect ["ok", demand.qty]
        {:ok, planned}
    end
  end

  def rebuild_qty(demand, qty) do
    %Postgrex.Result{rows: rows, columns: columns} =
      Ecto.Adapters.SQL.query!(Menu.Repo, PlanBuilder.magic_product_query(demand.product_id, demand.price, qty), [])

    list = PlanBuilder.make_map(rows, columns)
    [top|_] = Enum.filter(list, fn(l)-> l.parent_uid == nil end)
    PlanBuilder.make_tree(top, list)
  end

end