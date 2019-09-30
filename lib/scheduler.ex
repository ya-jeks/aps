defmodule Scheduler do

  def sch_reductor(task, {allocated_tasks, not_allocated, ints}) do
    case guess(task, ints) do
      {:ok, [updated_task, _, free_ints]} ->
        {allocated_tasks ++ [updated_task], not_allocated, free_ints}
      {:error, [task, _, free_ints]} ->
        {allocated_tasks, not_allocated ++ [task], free_ints}
    end
  end

  def guess(task, ints) do 
    case allocate(task, ints) do
      {:ok, res} -> 
        IO.inspect ["max ok", task.qty]
        {:ok, res}
      {:error, _} -> 
        IO.inspect ["err, going to guess", task.qty]
        guess(0..task.qty, task, ints)
    end 
  end 
  def guess(min..max, task, ints) when 0 == (max - 1) do
    IO.inspect ["zero", min, max]
    {:error, [task, "", ints]}
  end
  def guess(min..max, task, ints) when min == (max - 1) do
    min_task = rebuild_qty(task, min)
    IO.inspect ["min", min, max]
    allocate(min_task, ints)
  end
  def guess(min..max, task, ints) when min < max do
    mid = min + Integer.floor_div((max - min), 2)
    mid_task = rebuild_qty(task, mid)

    case allocate(mid_task, ints) do
      {:ok, _} ->
        IO.inspect ["upper", mid, max]
        guess(mid..max, mid_task, ints)
      {:error, _} ->
        IO.inspect ["lower", min, mid]
        guess(min..mid, mid_task, ints)
    end
  end

  def rebuild_qty(demand, qty) do
    %Postgrex.Result{rows: rows, columns: columns} =
      Ecto.Adapters.SQL.query!(Menu.Repo, PlanBuilder.magic_product_query(demand.product_id, demand.price, qty), [])

    list = PlanBuilder.make_map(rows, columns)
    [top|_] = Enum.filter(list, fn(l)-> l.parent_uid == nil end)
    PlanBuilder.make_tree(top, list)
  end

  # no intervals
  def allocate(task, []), do: {:error, [task, 0, []]}
  def allocate(task, ints) do
    {sub_state, subs, task_start, tail_intervals} = case task.subtasks do
      [] -> {:ok, [], 0, ints}
      subtasks -> Enum.reduce(subtasks, {:ok, [], 0, ints}, &alloc_reductor/2)
    end

    case sub_state do
      :error -> {:error, [task, 0, ints]} # проброс ошибки наверх
      :ok ->
        # tune task_start with given free intervals
        {state, [new_start, free_intervals]} = IntervalFitter.call(task_start, task.kind, task.duration, tail_intervals)
        updated_task = Map.merge(task, %{subtasks: subs, start: new_start})
        {state, [updated_task, new_start, Enum.sort_by(free_intervals, fn(i)-> [i.kind, i.start] end)]}
      end
  end

  def alloc_reductor(task, {latest_state, allocated_tasks, latest_finish, acc_ints}) do
    {state, [updated_task, new_start, rest_ints]} = allocate(task, acc_ints)
    new_state = case latest_state do # проброс ошибки
      :error -> :error
      :ok -> state
    end
    {
      new_state,
      [updated_task|allocated_tasks],
      Enum.max([latest_finish, new_start + task.duration]), # parent starts when latest subtask finishes
      rest_ints
    }
  end

end
