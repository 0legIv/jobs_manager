defmodule JobsManager.Jobs.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias JobsManager.Jobs.Profession

  schema "categories" do
    field :name, :string

    has_many :profession, Profession
    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
