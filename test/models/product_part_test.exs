defmodule Menu.ProductPartTest do
  use Menu.ModelCase

  alias Menu.ProductPart

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ProductPart.changeset(%ProductPart{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ProductPart.changeset(%ProductPart{}, @invalid_attrs)
    refute changeset.valid?
  end
end
