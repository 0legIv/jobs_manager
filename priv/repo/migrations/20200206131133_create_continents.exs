defmodule JobsManager.Repo.Migrations.CreateContinents do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION postgis;")

    create table(:continents) do
      add :name, :string

      timestamps()
    end

    execute("SELECT AddGeometryColumn ('continents','coordinates',4326,'MULTIPOLYGON',2);")
  end
end
