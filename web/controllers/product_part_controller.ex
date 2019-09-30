defmodule Menu.ProductPartController do
  use Menu.Web, :controller

  alias Menu.ProductPart

  def index(conn, _params) do
    user_team = current_team(conn)
    query = from u in ProductPart, order_by: [u.id], where: u.team_id == ^user_team.id

    product_parts = Repo.all(query) |> Repo.preload([:product, :part])
    render(conn, "index.html", product_parts: product_parts)
  end

  def new(conn, _params) do
    changeset = ProductPart.changeset(%ProductPart{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product_part" => product_part_params}) do
    changeset = ProductPart.changeset(%ProductPart{}, product_part_params)

    case Repo.insert(changeset) do
      {:ok, _product_part} ->
        conn
        |> put_flash(:info, "Product part created successfully.")
        |> redirect(to: product_part_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_team = current_team(conn)
    query = from u in ProductPart, order_by: [u.id], where: u.team_id == ^user_team.id and u.id == ^id

    product_part = Repo.one(query)
    render(conn, "show.html", product_part: product_part)
  end

  def edit(conn, %{"id" => id}) do
    product_part = Repo.get!(ProductPart, id)
    changeset = ProductPart.changeset(product_part)
    render(conn, "edit.html", product_part: product_part, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product_part" => product_part_params}) do
    product_part = Repo.get!(ProductPart, id)
    changeset = ProductPart.changeset(product_part, product_part_params)

    case Repo.update(changeset) do
      {:ok, product_part} ->
        conn
        |> put_flash(:info, "Product part updated successfully.")
        |> redirect(to: product_part_path(conn, :show, product_part))
      {:error, changeset} ->
        render(conn, "edit.html", product_part: product_part, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product_part = Repo.get!(ProductPart, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(product_part)

    conn
    |> put_flash(:info, "Product part deleted successfully.")
    |> redirect(to: product_part_path(conn, :index))
  end
end
