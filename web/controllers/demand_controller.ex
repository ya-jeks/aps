defmodule Menu.DemandController do
  use Menu.Web, :controller
  alias Menu.Demand

  def index(conn, _params) do
    user_team = current_team(conn)
    query = from u in Demand, order_by: [u.id], where: u.team_id == ^user_team.id
    demands = Repo.all(query) |> Repo.preload([:product])
    case get_format(conn) do
      "html" -> render(conn, "index.html", demands: demands)
      "json" -> render(conn, "index.json", demands: demands)
    end
  end

  def new(conn, _params) do
    changeset = Demand.changeset(%Demand{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"demand" => demand_params}) do
    demand_params = Map.merge(demand_params, %{"team_id" => current_team(conn).id})
    changeset = Demand.changeset(%Demand{}, demand_params)

    IO.inspect changeset
    case Repo.insert(changeset) do
      {:ok, _demand} ->
        conn
        |> put_flash(:info, "Demand created successfully.")
        |> redirect(to: demand_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    demand = Repo.get!(Demand, id)
    render(conn, "show.html", demand: demand)
  end

  def edit(conn, %{"id" => id}) do
    demand = Repo.get!(Demand, id)
    changeset = Demand.changeset(demand)
    render(conn, "edit.html", demand: demand, changeset: changeset)
  end

  def update(conn, %{"id" => id, "demand" => demand_params}) do
    demand = Repo.get!(Demand, id)
    changeset = Demand.changeset(demand, demand_params)

    case Repo.update(changeset) do
      {:ok, demand} ->
        conn
        |> put_flash(:info, "Demand updated successfully.")
        |> redirect(to: demand_path(conn, :show, demand))
      {:error, changeset} -> render(conn, "edit.html", demand: demand, changeset: changeset)
    end
  end

  def update_qty(conn, %{"id" => id, "demand" => demand_params}) do
    demand = Repo.get!(Demand, id) |> Repo.preload([:product])
    changeset = Demand.changeset(demand, demand_params)

    case Repo.update(changeset) do
      {:ok, demand} -> render(conn, "demand.json", demand: demand)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Menu.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    demand = Repo.get!(Demand, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(demand)

    conn
    |> put_flash(:info, "Demand deleted successfully.")
    |> redirect(to: demand_path(conn, :index))
  end
end
