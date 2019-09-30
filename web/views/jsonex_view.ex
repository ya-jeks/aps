# defmodule Menu.JsonexView do
#   use Menu.Web, :view
#
#   def render("index.json", %{jsonexs: jsonexs}) do
#     %{data: render_many(jsonexs, Menu.JsonexView, "jsonex.json")}
#   end
#
#   def render("show.json", %{jsonex: jsonex}) do
#     %{data: render_one(jsonex, Menu.JsonexView, "jsonex.json")}
#   end
#
#   def render("jsonex.json", %{jsonex: jsonex}) do
#     %{id: jsonex.id,
#       hello: jsonex.hello}
#   end
# end
