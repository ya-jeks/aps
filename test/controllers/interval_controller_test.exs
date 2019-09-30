defmodule Menu.IntervalControllerTest do
  use Menu.ConnCase

  alias Menu.Interval
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, interval_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing intervals"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, interval_path(conn, :new)
    assert html_response(conn, 200) =~ "New interval"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, interval_path(conn, :create), interval: @valid_attrs
    assert redirected_to(conn) == interval_path(conn, :index)
    assert Repo.get_by(Interval, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, interval_path(conn, :create), interval: @invalid_attrs
    assert html_response(conn, 200) =~ "New interval"
  end

  test "shows chosen resource", %{conn: conn} do
    interval = Repo.insert! %Interval{}
    conn = get conn, interval_path(conn, :show, interval)
    assert html_response(conn, 200) =~ "Show interval"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, interval_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    interval = Repo.insert! %Interval{}
    conn = get conn, interval_path(conn, :edit, interval)
    assert html_response(conn, 200) =~ "Edit interval"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    interval = Repo.insert! %Interval{}
    conn = put conn, interval_path(conn, :update, interval), interval: @valid_attrs
    assert redirected_to(conn) == interval_path(conn, :show, interval)
    assert Repo.get_by(Interval, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    interval = Repo.insert! %Interval{}
    conn = put conn, interval_path(conn, :update, interval), interval: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit interval"
  end

  test "deletes chosen resource", %{conn: conn} do
    interval = Repo.insert! %Interval{}
    conn = delete conn, interval_path(conn, :delete, interval)
    assert redirected_to(conn) == interval_path(conn, :index)
    refute Repo.get(Interval, interval.id)
  end
end
