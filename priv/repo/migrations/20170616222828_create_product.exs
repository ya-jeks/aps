defmodule Menu.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :price, :decimal, precision: 15, scale: 2
      add :duration, :integer
      add :kind, :string
      add :team_id, references(:teams, on_delete: :nothing), null: false

      timestamps()
    end
    create index(:products, [:team_id])

  end
end
