defmodule IntervalFitter do

  def call(start, kind, duration, ints), do: call(start, kind, duration, ints, [])
  def call(start, _kind, _duration, [], stash), do: {:error, [start, stash]}
  def call(start, kind, duration, [fi|ri], stash) do
    case kind == fi.kind do
      true ->
        start = case start > fi.start do
          true -> start
          _ -> fi.start
        end

        finish = start + duration
        ifinish = fi.start + fi.duration
        prev_i = Map.merge fi, %{duration: (start - fi.start)}
        post_i = %Menu.Interval{duration: (ifinish - finish), kind: fi.kind, title: "new", start: finish}

        cond do
          start == fi.start && finish == ifinish ->
            {:ok, [start, stash ++ ri]}
          start > fi.start && finish < ifinish ->
            {:ok, [start, stash ++ [prev_i] ++ [post_i|ri]]}
          start > fi.start && finish == ifinish ->
            {:ok, [start, stash ++ [prev_i|ri]]}
          start == fi.start && finish < ifinish ->
            {:ok, [start, stash ++ [post_i|ri]]}
          true ->
            call(start, kind, duration, ri, stash ++ [fi]) # does not fit by size
        end

      _ -> call(start, kind, duration, ri, stash ++ [fi]) # does not fit by type
    end
  end
end