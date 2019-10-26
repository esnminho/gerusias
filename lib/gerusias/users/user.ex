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
    changeset =
      pow_changeset(user_or_changeset, attrs)
      |> pow_changeset(attrs)
      |> pow_extension_changeset(attrs)
      |> changeset_role(attrs)

    case Ecto.get_meta(changeset.data, :state) do
      :built -> changeset
      _any -> changeset_assoc(changeset, attrs)
    end

    changeset

    #    |> changeset_assoc(attrs)
  end

  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end

  def changeset_assoc(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.put_assoc(:profile, Badge.changeset(%Badge{}, attrs), required: true)
  end

  # |> Ecto.Changeset.cast_assoc(:profile, required: true)

  #
  defp create(changeset), do: update_in(changeset.data, &Repo.preload(&1, :profile))
  #  defp update(changeset), do: changeset |> Repo.preload(:profile)
end
