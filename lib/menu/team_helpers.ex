defmodule Menu.TeamHelpers do
  def current_user(conn) do
    Coherence.current_user(conn) |> Menu.Repo.preload([:teams])
  end

  def current_team(conn) do
    case current_user(conn).teams do
      [] -> nil
      [team] -> team
      [team|_] -> team
    end
  end
end