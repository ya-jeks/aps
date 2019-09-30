defmodule Planner.Demands do

  def call(demands, order, intervals) do
    demands |>
    sorted_demands(order) |>
    Enum.reduce({[], [], intervals}, &Scheduler.sch_reductor/2)
  end

  def sorted_demands(demands, order) do
    demands |>
    Enum.map(fn(dm)-> sorted_dm(dm, order) end)
  end

  def sorted_dm(dm, order), do: sorted_dm(dm, 0, order)
  def sorted_dm(dm, zero, order) do
    case dm.subtasks do
      [] ->
        Map.merge dm, %{earliest: Map.new([{dm.kind, zero - dm.duration}])}
      subtasks ->
        processed_subtasks = subtasks |> Enum.map(fn(s)-> sorted_dm(s, zero - dm.duration, order) end)
        earliest_from_subtasks = Enum.reduce(processed_subtasks, %{}, fn(r, acc)->
          Map.merge acc, Map.get(r, :earliest, %{}), fn(_k, v1, v2) -> Enum.min [v1, v2] end
        end)
        dm_earliest = Map.new [{dm.kind, zero - dm.duration}]
        earliest = Map.merge(dm_earliest, earliest_from_subtasks)
        Map.merge dm, %{
          earliest: earliest,
          subtasks: processed_subtasks |> Enum.sort_by(fn(rec)->
            # sort branches, first on the most busy resource, order looks like ["B", "R", "A", "C", "D", "S"]
            Enum.map(order, fn(o)-> rec.earliest[o] end)
          end)
        }
    end
  end

end