defmodule Menu.TeamMember do
  use Menu.Web, :model

  schema "team_members" do
    belongs_to :team, Menu.Team
    belongs_to :member, Menu.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:team_id, :member_id])
    |> validate_required([:team_id, :member_id])
  end
end
