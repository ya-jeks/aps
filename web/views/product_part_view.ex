defmodule Menu.ProductPartView do
  use Menu.Web, :view
  import Ecto.Query, only: [from: 2]

  def products do
    Menu.Repo.all(from p in Menu.Product, select: [:id, :title])
    |> Enum.map(&{&1.title, &1.id})
  end

end
