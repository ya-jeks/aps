defmodule Menu.ProductPartControllerTest do
  use Menu.ConnCase

  alias Menu.ProductPart
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, product_part_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing product parts"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, product_part_path(conn, :new)
    assert html_response(conn, 200) =~ "New product part"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, product_part_path(conn, :create), product_part: @valid_attrs
    assert redirected_to(conn) == product_part_path(conn, :index)
    assert Repo.get_by(ProductPart, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, product_part_path(conn, :create), product_part: @invalid_attrs
    assert html_response(conn, 200) =~ "New product part"
  end

  test "shows chosen resource", %{conn: conn} do
    product_part = Repo.insert! %ProductPart{}
    conn = get conn, product_part_path(conn, :show, product_part)
    assert html_response(conn, 200) =~ "Show product part"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, product_part_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    product_part = Repo.insert! %ProductPart{}
    conn = get conn, product_part_path(conn, :edit, product_part)
    assert html_response(conn, 200) =~ "Edit product part"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    product_part = Repo.insert! %ProductPart{}
    conn = put conn, product_part_path(conn, :update, product_part), product_part: @valid_attrs
    assert redirected_to(conn) == product_part_path(conn, :show, product_part)
    assert Repo.get_by(ProductPart, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    product_part = Repo.insert! %ProductPart{}
    conn = put conn, product_part_path(conn, :update, product_part), product_part: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit product part"
  end

  test "deletes chosen resource", %{conn: conn} do
    product_part = Repo.insert! %ProductPart{}
    conn = delete conn, product_part_path(conn, :delete, product_part)
    assert redirected_to(conn) == product_part_path(conn, :index)
    refute Repo.get(ProductPart, product_part.id)
  end
end
