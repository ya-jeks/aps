defmodule Menu.User do
  use Menu.Web, :model
  use Coherence.Schema
  require Logger

  schema "users" do
    field :name, :string
    field :email, :string
    field :settings, :map
    field :password_hash, :string
    field :current_password, :string, virtual: true
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    has_many :team_members, Menu.TeamMember, foreign_key: :member_id
    has_many :teams, through: [:team_members, :member]

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email, :password_hash, :current_password, :password, :password_confirmation])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end
end
