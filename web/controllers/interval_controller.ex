defmodule Menu.IntervalController do
  use Menu.Web, :controller
  alias Menu.Interval

  def index(conn, _params) do
    user_team = current_team(conn)
    query = from u in Interval, order_by: [u.kind, u.start], where: u.team_id == ^user_team.id
    intervals = Repo.all(query)
    case get_format(conn) do
      "html" -> render(conn, "index.html", intervals: intervals)
      "json" -> render(conn, "index.json", intervals: intervals)
    end
  end

  def new(conn, _params) do
    changeset = Interval.changeset(%Interval{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"interval" => interval_params}) do
    interval_params = Map.merge(interval_params, %{"team_id" => current_team(conn).id})
    changeset = Interval.changeset(%Interval{}, interval_params)

    case Repo.insert(changeset) do
      {:ok, _interval} ->
        conn
        |> put_flash(:info, "Interval created successfully.")
        |> redirect(to: interval_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    interval = Repo.get!(Interval, id)
    render(conn, "show.html", interval: interval)
  end

  def edit(conn, %{"id" => id}) do
    interval = Repo.get!(Interval, id)
    changeset = Interval.changeset(interval)
    render(conn, "edit.html", interval: interval, changeset: changeset)
  end

  def update(conn, %{"id" => id, "interval" => interval_params}) do
    interval = Repo.get!(Interval, id)
    changeset = Interval.changeset(interval, interval_params)

    case Repo.update(changeset) do
      {:ok,_} ->
        conn
        |> put_flash(:info, "Interval updated successfully.")
        |> redirect(to: interval_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", interval: interval, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    interval = Repo.get!(Interval, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(interval)

    conn
    |> put_flash(:info, "Interval deleted successfully.")
    |> redirect(to: interval_path(conn, :index))
  end
end
