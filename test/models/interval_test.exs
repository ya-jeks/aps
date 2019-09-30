defmodule Menu.IntervalTest do
  use Menu.ModelCase

  alias Menu.Interval

  @valid_attrs %{duration: 42, kind: "some content", title: "some content", start: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Interval.changeset(%Interval{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Interval.changeset(%Interval{}, @invalid_attrs)
    refute changeset.valid?
  end
end
