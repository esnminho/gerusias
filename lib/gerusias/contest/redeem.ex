defmodule Gerusias.Contest.Redeem do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gerusias.Users.User

  schema "redeems" do
    field :user_id, :id
    field :badge_id, :id
    belongs_to :redeemer, User

    timestamps()
  end

  @doc false
  def changeset(redeem, attrs) do
    redeem
    |> cast(attrs, [])
    |> validate_required([])
  end
end
