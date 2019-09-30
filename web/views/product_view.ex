defmodule Menu.ProductView do
  use Menu.Web, :view
  import Ecto.Query, only: [from: 2]
  alias Menu.Product

  def products do
    Menu.Repo.all(from p in Product, select: [:id, :title])
    |> Enum.map(&{&1.title, &1.id})
  end

end
