defmodule Menu.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :title, :string, null: false

      timestamps()
    end
    create unique_index(:teams, [:title])

  end
end
