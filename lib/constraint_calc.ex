defmodule ConstraintCalc do

  def call(tasks, intervals) do
    blank_map = tasks |> Enum.reduce(%{}, fn(t, acc)-> # OPTIMIZE
      Map.update(acc, t.kind, 0, &(&1 + 0))
    end)

    required = tasks |> Enum.reduce(blank_map, fn(t, acc)->
      Map.update(acc, t.kind, 0, &(&1 + t.duration))
    end)

    available = intervals |> Enum.reduce(blank_map, fn(i, acc)->
      Map.update(acc, i.kind, 0, fn(v)-> v + i.duration end)
    end)

    constraint = required |> Enum.reduce(blank_map, fn({rk, rd}, acc)->
      Map.update acc, rk, 0, fn(_v)-> (rd - available[rk]) end
    end)

    order = Map.keys(constraint) |> Enum.sort_by(fn(kind)-> - constraint[kind] end)

    # %{"A" => 100, "B" => 200} => %{kind: "A", duration: "100"}
    required_map = required |> Enum.map(fn({k, v})->
      case available[k] do
        0 -> %{kind: k, duration: v, load_percent: 0}
        x -> %{kind: k, duration: v, load_percent: Float.ceil(v*100/x, 2)}
      end
    end)
    available_map = available |> Enum.map(fn({k, v})-> %{kind: k, duration: v, load_percent: 0} end)
    %{
      required: required_map,
      available: available_map,
      constraint: constraint,
      order: order
    }
  end
end