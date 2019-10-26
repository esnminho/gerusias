defmodule Gerusias.Users do
  use Pow.Ecto.Context,
    repo: Gerusias.Repo,
    user: Gerusias.Users.User

  @impl true
  def get_by(clauses) do
    clauses
    |> pow_get_by()
    |> preload_profile()
  end

  defp preload_profile(nil), do: nil

  defp preload_profile(user) do
    Gerusias.Repo.preload(user, :profile)
  end
end
