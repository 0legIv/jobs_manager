defmodule JobsManager.Repo.Migrations.CreateJobOffers do
  use Ecto.Migration

  def change do
    create table(:job_offers) do
      add :name, :string
      add :office_latitude, :float
      add :office_longitude, :float
      add :profession_id, references(:professions, on_delete: :nothing)
      add :contract_type_id, references(:contract_types, on_delete: :nothing)

      timestamps()
    end

    create index(:job_offers, [:profession_id])
    create index(:job_offers, [:contract_type_id])
  end
end
