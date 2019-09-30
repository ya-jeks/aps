defmodule Menu.Repo.Migrations.CreateTeamMember do
  use Ecto.Migration

  def change do
    create table(:team_members) do
      add :team_id, references(:teams, on_delete: :nothing), null: false
      add :member_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:team_members, [:team_id, :member_id], unique: true)
  end
end
