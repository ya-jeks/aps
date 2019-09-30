defmodule Menu.Repo.Migrations.CreateProductPart do
  use Ecto.Migration

  def change do
    create table(:product_parts) do
      add :product_id, references(:products, on_delete: :nothing), null: false
      add :part_id, references(:products, on_delete: :nothing), null: false
      add :team_id, references(:teams, on_delete: :nothing), null: false

      timestamps()
    end
    create index(:product_parts, [:team_id])

  end
end
