defmodule Menu.Product do
  use Menu.Web, :model

  schema "products" do
    field :title, :string
    field :price, :decimal
    field :duration, :integer
    field :kind, :string
    has_many :product_parts, Menu.ProductPart
    has_many :parts, through: [:product_parts, :part]
    belongs_to :team, Menu.Team

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :price, :duration, :kind])
    |> validate_required([:title, :price, :duration, :kind])

  end
end
