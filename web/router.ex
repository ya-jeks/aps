defmodule Menu.Router do
  use Menu.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
  end

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
    get "/sign_out", Coherence.SessionController, :delete
  end

  scope "/", Menu do
    pipe_through :browser
    # Add public routes below
  end

  scope "/", Menu do
    pipe_through :protected
    resources "/products", ProductController
    resources "/intervals", IntervalController
    get "/plans/estimate", PlanController, :estimate
    resources "/plans", PlanController
    resources "/demands", DemandController
    resources "/settings", SettingController
    resources "/product_parts", ProductPartController
    put "/demands/:id/qty", DemandController, :update_qty
    # Add protected routes below

    get "/", PageController, :index
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Menu do
  #   pipe_through :api
  # end
end
