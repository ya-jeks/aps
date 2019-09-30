defmodule Menu.DemandTest do
  use Menu.ModelCase

  alias Menu.Demand

  @valid_attrs %{price: "120.5", qty: 42, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Demand.changeset(%Demand{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Demand.changeset(%Demand{}, @invalid_attrs)
    refute changeset.valid?
  end
end
