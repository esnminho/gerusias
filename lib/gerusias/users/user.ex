defmodule Gerusias.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  alias Gerusias.Contest.Badge
  alias Gerusias.Contest.Redeem
  alias Gerusias.Repo

  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword, PowEmailConfirmation, PowInvitation]

  schema "users" do
    field :role, :string, default: "user"
    pow_user_fields()

    many_to_many :badges, Badge, join_through: Redeem
    has_many :redeems, Redeem
    has_one :profile, Badge

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    pow_changeset(user_or_changeset, attrs)
    |> pow_changeset(attrs)
    |> pow_extension_changeset(attrs)
    |> changeset_role(attrs)
    |> preload
    |> Ecto.Changeset.cast_assoc(:profile)
  end

  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end

  defp preload(changeset), do: update_in(changeset.data, &Repo.preload(&1, :profile))
end
