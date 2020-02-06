defmodule JobsManager.Jobs.JobOffer do
  use Ecto.Schema
  import Ecto.Changeset
  alias JobsManager.Jobs.Profession
  alias JobsManager.Jobs.ContractType

  schema "job_offers" do
    field :name, :string
    field :office_latitude, :float
    field :office_longitude, :float

    belongs_to(:profession, Profession)
    belongs_to(:contract_type, ContractType)
    timestamps()
  end

  @doc false
  def changeset(job_offer, attrs) do
    job_offer
    |> cast(attrs, [:name, :office_latitude, :office_longitude])
    |> validate_required([:name, :office_latitude, :office_longitude])
  end
end
