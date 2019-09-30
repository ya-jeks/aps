defmodule Menu.Repo.Migrations.CreateInterval do
  use Ecto.Migration

  def change do
    create table(:intervals) do
      add :title, :string
      add :kind, :string
      add :duration, :integer
      add :start, :integer
      add :team_id, references(:teams, on_delete: :nothing), null: false

      timestamps()
    end
    create index(:intervals, [:team_id])

  end
end
