defmodule Menu.Interval do
  use Menu.Web, :model

  schema "intervals" do
    field :title, :string
    field :kind, :string
    field :duration, :integer
    field :start, :integer
    belongs_to :team, Menu.Team

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :kind, :duration, :start, :team_id])
    |> validate_required([:title, :kind, :duration, :start, :team_id])

  end
end
