defmodule Menu.PlanController do
  use Menu.Web, :controller
  alias Menu.Demand
  alias Menu.Interval

  def index(conn, _params) do
    # plans = Repo.all(Plan)
    render(conn, "index.html", plans: [])
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def estimate(conn, %{"demands_ids" => demands_ids}) do
    user_team = current_team(conn)
    query = from u in Interval, order_by: [u.kind, u.start], where: u.team_id == ^user_team.id
    intervals = Repo.all(query)

    ids = Enum.join(demands_ids, ",")

    case PlanBuilder.call(ids, intervals) do
      {:ok, plan} ->
        conn
        |> render("estimate.json", plan: plan, team: user_team)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Menu.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def create(conn, _) do
    conn
    |> put_flash(:info, "No demand chosen for plan")
    |> redirect(to: plan_path(conn, :index))
  end

end
