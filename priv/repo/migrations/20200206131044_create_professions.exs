defmodule JobsManager.Repo.Migrations.CreateProfessions do
  use Ecto.Migration

  def change do
    create table(:professions) do
      add :name, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:professions, [:category_id])
  end
end
