defmodule JobsManager.Jobs.Profession do
  use Ecto.Schema
  import Ecto.Changeset

  alias JobsManager.Jobs.Category

  schema "professions" do
    field :name, :string

    belongs_to(:category, Category)
    timestamps()
  end

  @doc false
  def changeset(profession, attrs) do
    profession
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
