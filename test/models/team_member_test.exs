defmodule Menu.TeamMemberTest do
  use Menu.ModelCase

  alias Menu.TeamMember

  @valid_attrs %{member_id: 42, team_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TeamMember.changeset(%TeamMember{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TeamMember.changeset(%TeamMember{}, @invalid_attrs)
    refute changeset.valid?
  end
end
