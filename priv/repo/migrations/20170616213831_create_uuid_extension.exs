defmodule Menu.Repo.Migrations.CreateUuidExtension do
  use Ecto.Migration
  def change do
    execute "CREATE EXTENSION \"uuid-ossp\";"
  end
end

