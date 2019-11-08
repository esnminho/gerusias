defmodule Gerusias.Repo.Migrations.CreateBadges do
  use Ecto.Migration

  def change do
    create table(:badges) do
      add(:name, :string)
      add(:description, :string)
      add(:type, :string)

      timestamps()
    end
  end
end
