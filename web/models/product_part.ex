defmodule Menu.ProductPart do
  use Menu.Web, :model

  schema "product_parts" do
    belongs_to :product, Menu.Product
    belongs_to :part, Menu.Product
    belongs_to :team, Menu.Team

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:product_id, :part_id])
    |> validate_required([:product_id, :part_id])
  end
end
