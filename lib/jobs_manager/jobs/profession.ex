defmodule JobsManager.Jobs.Profession do
  use Ecto.Schema
  import Ecto.Changeset

  alias JobsManager.Jobs.Category
  alias JobsManager.Jobs.JobOffer

  schema "professions" do
    field :name, :string

    belongs_to(:category, Category)
    has_many :job_offer, JobOffer
    timestamps()
  end

  @doc false
  def changeset(profession, attrs) do
    profession
    |> cast(attrs, [:id, :name, :category_id])
    |> validate_required([:name, :category_id])
  end
end
