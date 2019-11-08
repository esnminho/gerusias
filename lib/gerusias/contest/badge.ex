defmodule Gerusias.Contest.Badge do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gerusias.Users.User
  alias Gerusias.Contest.Redeem

  schema "badges" do
    field :name, :string
    field :description, :string
    field :type, :string, default: "user"

    many_to_many :users, User, join_through: Redeem
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(badge, attrs) do
    badge
    |> cast(attrs, [:name, :description, :type])
    |> validate_required([:name, :description, :type])
  end
end
