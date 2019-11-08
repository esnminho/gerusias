defmodule Gerusias.Repo.Migrations.CreateRedeems do
  use Ecto.Migration

  def change do
    create table(:redeems) do
      add :user_id, references(:users, on_delete: :nothing)
      add :badge_id, references(:badges, on_delete: :nothing)
      add :redeemer_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:redeems, [:user_id])
    create index(:redeems, [:badge_id])
    create index(:redeems, [:redeemer_id])
  end
end
