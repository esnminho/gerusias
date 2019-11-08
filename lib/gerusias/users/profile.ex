defmodule Gerusias.Users.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :description, :string
    field :name, :string
    field :role, :string
    field :section, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :description, :section, :role])
    |> validate_required([:name, :description, :section, :role])
  end
end
