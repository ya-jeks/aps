defmodule Menu.Demand do
  use Menu.Web, :model

  schema "demands" do
    field :title, :string
    field :price, :decimal
    field :qty, :integer
    belongs_to :product, Menu.Product
    belongs_to :team, Menu.Team

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :price, :qty, :product_id, :team_id])
    |> validate_required([:title, :price, :qty, :product_id, :team_id])

  end

end
