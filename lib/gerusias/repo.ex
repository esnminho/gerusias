defmodule Gerusias.Repo do
  use Ecto.Repo,
    otp_app: :gerusias,
    adapter: Ecto.Adapters.Postgres
end
