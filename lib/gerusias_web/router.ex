defmodule GerusiasWeb.Router do
  use GerusiasWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router, otp_app: :gerusias

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :admin do
    plug GerusiasWeb.EnsureRolePlug, :admin
  end

  scope "/", PowInvitation.Phoenix, as: "pow_invitation" do
    pipe_through [:browser, :protected, :admin]

    resources "/invitations", InvitationController, only: [:new, :create, :show]
  end

  scope "/", Pow.Phoenix, as: "pow" do
    pipe_through [:browser, :protected]

    resources "/registration", RegistrationController,
      singleton: true,
      only: [:edit, :update, :delete]
  end

  scope "/" do
    pipe_through :browser

    get("/", Pow.Phoenix.SessionController, :new)
    pow_session_routes()
    pow_extension_routes()
  end

  scope "/", GerusiasWeb do
    pipe_through [:browser, :protected]

    get "/home", PageController, :index
    resources "/badges", BadgeController, only: [:index, :show]
    resources "/redeems", RedeemController, only: [:index]
    resources "/profiles", ProfileController, only: [:index, :show, :edit]
  end

  scope "/admin", GerusiasWeb do
    pipe_through [:browser, :protected, :admin]
    resources "/profiles", ProfileController
    resources "/badges", BadgeController
    resources "/redeems", RedeemController
  end
end
