defmodule Gerusias.Repo.Migrations.AddUserIdToBadge do
  use Ecto.Migration

  def change do
    alter table(:badges) do
      add(:user_id, references(:users))
    end
  end
end
