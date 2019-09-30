defmodule Menu.DemandControllerTest do
  use Menu.ConnCase

  alias Menu.Demand
  @valid_attrs %{price: "120.5", qty: 42, title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, demand_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing demands"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, demand_path(conn, :new)
    assert html_response(conn, 200) =~ "New demand"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, demand_path(conn, :create), demand: @valid_attrs
    assert redirected_to(conn) == demand_path(conn, :index)
    assert Repo.get_by(Demand, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, demand_path(conn, :create), demand: @invalid_attrs
    assert html_response(conn, 200) =~ "New demand"
  end

  test "shows chosen resource", %{conn: conn} do
    demand = Repo.insert! %Demand{}
    conn = get conn, demand_path(conn, :show, demand)
    assert html_response(conn, 200) =~ "Show demand"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, demand_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    demand = Repo.insert! %Demand{}
    conn = get conn, demand_path(conn, :edit, demand)
    assert html_response(conn, 200) =~ "Edit demand"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    demand = Repo.insert! %Demand{}
    conn = put conn, demand_path(conn, :update, demand), demand: @valid_attrs
    assert redirected_to(conn) == demand_path(conn, :show, demand)
    assert Repo.get_by(Demand, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    demand = Repo.insert! %Demand{}
    conn = put conn, demand_path(conn, :update, demand), demand: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit demand"
  end

  test "deletes chosen resource", %{conn: conn} do
    demand = Repo.insert! %Demand{}
    conn = delete conn, demand_path(conn, :delete, demand)
    assert redirected_to(conn) == demand_path(conn, :index)
    refute Repo.get(Demand, demand.id)
  end
end
