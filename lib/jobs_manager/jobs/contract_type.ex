defmodule JobsManager.Jobs.ContractType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contract_types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(contract_type, attrs) do
    contract_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
