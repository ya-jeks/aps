defmodule Menu.Team do
  use Menu.Web, :model

  schema "teams" do
    field :title, :string
    has_many :team_members, Menu.TeamMember
    has_many :members, through: [:team_members, :member]
    has_many :products, Menu.Product
    has_many :product_parts, Menu.ProductPart
    has_many :demands, Menu.Demand
    has_many :intervals, Menu.Interval

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> cast_assoc(:team_members, required: false)
    |> validate_required([:title])
  end
end
