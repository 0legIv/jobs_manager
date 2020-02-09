defmodule JobsManager.Jobs do
  @moduledoc """
  The Jobs context.
  """

  import Ecto.Query, warn: false
  import Geo.PostGIS
  alias JobsManager.Repo

  alias JobsManager.DistanceHelpers
  alias JobsManager.Jobs.ContractType

  @doc """
  Returns the list of contract_types.

  ## Examples

      iex> list_contract_types()
      [%ContractType{}, ...]

  """
  def list_contract_types do
    Repo.all(ContractType)
  end

  @doc """
  Gets a single contract_type.

  Raises `Ecto.NoResultsError` if the Contract type does not exist.

  ## Examples

      iex> get_contract_type!(123)
      %ContractType{}

      iex> get_contract_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contract_type!(id), do: Repo.get!(ContractType, id)

  @doc """
  Creates a contract_type.

  ## Examples

      iex> create_contract_type(%{field: value})
      {:ok, %ContractType{}}

      iex> create_contract_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contract_type(attrs \\ %{}) do
    %ContractType{}
    |> ContractType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contract_type.

  ## Examples

      iex> update_contract_type(contract_type, %{field: new_value})
      {:ok, %ContractType{}}

      iex> update_contract_type(contract_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contract_type(%ContractType{} = contract_type, attrs) do
    contract_type
    |> ContractType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a contract_type.

  ## Examples

      iex> delete_contract_type(contract_type)
      {:ok, %ContractType{}}

      iex> delete_contract_type(contract_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contract_type(%ContractType{} = contract_type) do
    Repo.delete(contract_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contract_type changes.

  ## Examples

      iex> change_contract_type(contract_type)
      %Ecto.Changeset{source: %ContractType{}}

  """
  def change_contract_type(%ContractType{} = contract_type) do
    ContractType.changeset(contract_type, %{})
  end

  alias JobsManager.Jobs.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end

  alias JobsManager.Jobs.Profession

  @doc """
  Returns the list of professions.

  ## Examples

      iex> list_professions()
      [%Profession{}, ...]

  """
  def list_professions do
    Repo.all(Profession)
  end

  @doc """
  Gets a single profession.

  Raises `Ecto.NoResultsError` if the Profession does not exist.

  ## Examples

      iex> get_profession!(123)
      %Profession{}

      iex> get_profession!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profession!(id), do: Repo.get!(Profession, id)

  @doc """
  Creates a profession.

  ## Examples

      iex> create_profession(%{field: value})
      {:ok, %Profession{}}

      iex> create_profession(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profession(attrs \\ %{}) do
    %Profession{}
    |> Profession.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profession.

  ## Examples

      iex> update_profession(profession, %{field: new_value})
      {:ok, %Profession{}}

      iex> update_profession(profession, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profession(%Profession{} = profession, attrs) do
    profession
    |> Profession.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a profession.

  ## Examples

      iex> delete_profession(profession)
      {:ok, %Profession{}}

      iex> delete_profession(profession)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profession(%Profession{} = profession) do
    Repo.delete(profession)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profession changes.

  ## Examples

      iex> change_profession(profession)
      %Ecto.Changeset{source: %Profession{}}

  """
  def change_profession(%Profession{} = profession) do
    Profession.changeset(profession, %{})
  end

  alias JobsManager.Jobs.JobOffer

  @doc """
  Returns the list of job_offers.

  ## Examples

      iex> list_job_offers()
      [%JobOffer{}, ...]

  """
  def list_job_offers do
    Repo.all(JobOffer)
  end

  @doc """
  Gets a single job_offer.

  Raises `Ecto.NoResultsError` if the Job offer does not exist.

  ## Examples

      iex> get_job_offer!(123)
      %JobOffer{}

      iex> get_job_offer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_job_offer!(id), do: Repo.get!(JobOffer, id)

  @doc """
  Creates a job_offer.

  ## Examples

      iex> create_job_offer(%{field: value})
      {:ok, %JobOffer{}}

      iex> create_job_offer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_job_offer(attrs \\ %{}) do
    %JobOffer{}
    |> JobOffer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a job_offer.

  ## Examples

      iex> update_job_offer(job_offer, %{field: new_value})
      {:ok, %JobOffer{}}

      iex> update_job_offer(job_offer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_job_offer(%JobOffer{} = job_offer, attrs) do
    job_offer
    |> JobOffer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a job_offer.

  ## Examples

      iex> delete_job_offer(job_offer)
      {:ok, %JobOffer{}}

      iex> delete_job_offer(job_offer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_job_offer(%JobOffer{} = job_offer) do
    Repo.delete(job_offer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking job_offer changes.

  ## Examples

      iex> change_job_offer(job_offer)
      %Ecto.Changeset{source: %JobOffer{}}

  """
  def change_job_offer(%JobOffer{} = job_offer) do
    JobOffer.changeset(job_offer, %{})
  end

  alias JobsManager.Jobs.Continent

  def create_continent(attrs \\ %{}) do
    %Continent{}
    |> Continent.changeset(attrs)
    |> Repo.insert()
  end

  def get_continent_id_by_coordinate(point) do
    from(c in Continent,
      where: st_contains(c.coordinates, ^point),
      select: c.id
    )
    |> Repo.one()
  end

  def get_job_offers_in_radius(lat, lon, radius) do
    point = %Geo.Point{coordinates: {lon, lat}, srid: 4326}
    radius = DistanceHelpers.km_to_m(radius)

    from(j in JobOffer,
      join: c in Continent,
      on: j.continent_id == c.id,
      where: st_dwithin_in_meters(j.coordinate, ^point, ^radius),
      preload: [:profession, :contract_type],
      select: %{
        job_offer: j,
        proximity: st_distance_in_meters(j.coordinate, ^point),
        continent: c.name
      }
    )
    |> Repo.all()
  end

  def all_job_offers_to_geojson() do
    job_offers = list_job_offers()

    features =
      Enum.map(job_offers, fn offer ->
        %{
          type: "Feature",
          properties: %{},
          geometry: %{
            type: "Point",
            coordinates: [
              elem(offer.coordinate.coordinates, 0),
              elem(offer.coordinate.coordinates, 1)
            ]
          }
        }
      end)

    json =
      %{
        type: "FeatureCollection",
        features: features
      }
      |> Jason.encode!()

    File.write("job_offers.json", json)
  end

  def count_job_offers_by_profession_continent() do
    from(j in JobOffer,
      join: c in Continent,
      on: j.continent_id == c.id,
      join: p in Profession,
      on: j.profession_id == p.id,
      group_by: [p.id, c.id],
      select: %{
        p.name => %{
          c.name => count(j.id)
        }
      }
    )
    |> Repo.all()
    |> Enum.reduce(%{}, fn job_offers, acc ->
      Map.merge(acc, job_offers, fn _k, v1, v2 ->
        Map.merge(v1, v2)
      end)
    end)
  end
end
