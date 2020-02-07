defmodule JobsManager.Repo.Migrations.CreateJobOffers do
  use Ecto.Migration

  def change do
    create table(:job_offers) do
      add :name, :string
      add :profession_id, references(:professions, on_delete: :nothing)
      add :contract_type_id, references(:contract_types, on_delete: :nothing)
      add :continent_id, references(:continents, on_delete: :nothing)

      timestamps()
    end

    execute("SELECT AddGeometryColumn ('job_offers','coordinate',4326,'POINT',2);")
    create index(:job_offers, [:profession_id])
    create index(:job_offers, [:contract_type_id])
    create index(:job_offers, [:continent_id])
  end
end
