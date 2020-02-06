defmodule JobsManager.Repo.Migrations.CreateContractTypes do
  use Ecto.Migration

  def change do
    create table(:contract_types) do
      add :name, :string

      timestamps()
    end

  end
end
