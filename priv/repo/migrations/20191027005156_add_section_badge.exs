defmodule Gerusias.Repo.Migrations.AddSectionBadge do
  use Ecto.Migration

  def change do
    alter table(:badges) do
      add(:section, :string)
    end
  end
end
