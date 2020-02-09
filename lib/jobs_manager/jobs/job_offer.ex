defmodule JobsManager.Jobs.JobOffer do
  use Ecto.Schema
  import Ecto.Changeset
  alias JobsManager.Jobs
  alias JobsManager.Jobs.Profession
  alias JobsManager.Jobs.ContractType
  alias JobsManager.Jobs.Continent

  schema "job_offers" do
    field :name, :string
    field :coordinate, Geo.PostGIS.Geometry

    belongs_to(:profession, Profession)
    belongs_to(:contract_type, ContractType)
    belongs_to(:continent, Continent)
    timestamps()
  end

  @doc false
  def changeset(job_offer, attrs) do
    job_offer
    |> cast(attrs, [:name, :profession_id, :contract_type_id, :coordinate, :continent_id])
    |> prepare_changes(fn changeset ->
      continent_id =
        changeset.changes.coordinate
        |> Jobs.get_continent_id_by_coordinate()

      put_change(changeset, :continent_id, continent_id)
    end)
    |> validate_required([
      :name,
      :profession_id,
      :contract_type_id,
      :coordinate
    ])
  end
end
