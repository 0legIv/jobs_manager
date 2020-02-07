defmodule JobsManager.Jobs.Continent do
  use Ecto.Schema
  import Ecto.Changeset

  alias JobsManager.Jobs.JobOffer

  schema "continents" do
    field :name, :string
    field :coordinates, Geo.PostGIS.Geometry

    has_many :job_offer, JobOffer
    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :coordinates])
    |> validate_required([:name, :coordinates])
  end
end
