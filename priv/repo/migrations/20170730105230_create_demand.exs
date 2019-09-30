defmodule Menu.Repo.Migrations.CreateDemand do
  use Ecto.Migration

  def change do
    create table(:demands) do
      add :title, :string
      add :price, :decimal, precision: 15, scale: 2
      add :qty, :integer
      add :product_id, references(:products, on_delete: :nothing), null: false
      add :team_id, references(:teams, on_delete: :nothing), null: false

      timestamps()
    end
    create index(:demands, [:product_id])
    create index(:demands, [:team_id])

  end
end
