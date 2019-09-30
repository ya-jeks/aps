defmodule Menu.DemandView do
  use Menu.Web, :view
  import Ecto.Query, only: [from: 2]
  alias Menu.Product

  def products do
    Menu.Repo.all(from p in Product, select: [:id, :title])
    |> Enum.map(&{&1.title, &1.id})
  end

  def render("index.json", %{demands: demands}) do
    render_many(demands, Menu.DemandView, "demand.json")
  end

  def render("demand.json", %{demand: d}) do
    %{
      id: d.id,
      title: d.title,
      product_id: d.product_id,
      product_title: d.product.title,
      qty: d.qty,
      price: d.price,
      duration: d.product.duration
    }
  end

end
