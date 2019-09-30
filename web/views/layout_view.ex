defmodule Menu.LayoutView do
  use Menu.Web, :view

  def page_name(conn) do
    case conn.request_path do
      "/" -> "Plan"
      "/products" -> "Products"
      "/product_parts" -> "Parts"
      "/demands" -> "Demands"
      "/intervals" -> "Intervals"
      "/plans" -> "Plan"
      "/product_parts/new" -> "New part"
      _ -> ""
    end
  end

end
