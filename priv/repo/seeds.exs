alias JobsManager.Jobs

professions_file =
  "priv/technical-test-professions.csv"
  |> File.stream!()
  |> CSV.decode!(headers: true)

job_offers_file =
  "priv/technical-test-jobs.csv"
  |> File.stream!()
  |> CSV.decode!(headers: true)

categories =
  professions_file
  |> Enum.uniq_by(& &1["category_name"])
  |> Enum.map(fn prof ->
    {:ok, category} = Jobs.create_category(%{name: prof["category_name"]})
    category
  end)
  |> Enum.reduce(%{}, fn category, acc ->
    Map.put(acc, category.name, category.id)
  end)

contract_types =
  job_offers_file
  |> Enum.uniq_by(& &1["contract_type"])
  |> Enum.map(fn prof ->
    {:ok, contract_type} = Jobs.create_contract_type(%{name: prof["contract_type"]})
    contract_type
  end)
  |> Enum.reduce(%{}, fn contract_type, acc ->
    Map.put(acc, contract_type.name, contract_type.id)
  end)

professions =
  professions_file
  |> Enum.sort(&(String.to_integer(&1["id"]) < String.to_integer(&2["id"])))
  |> Enum.map(fn prof ->
    Jobs.create_profession(%{
      id: prof["id"],
      name: prof["name"],
      category_id: categories[prof["category_name"]]
    })
  end)

africa_coordinates = "priv/africa.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

Jobs.create_continent(%{name: "Africa", coordinates: africa_coordinates})

asia_coordinates = "priv/asia.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

Jobs.create_continent(%{name: "Asia", coordinates: asia_coordinates})

australia_coordinates =
  "priv/australia.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

Jobs.create_continent(%{name: "Australia", coordinates: australia_coordinates})

europe_coordinates = "priv/europe.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

Jobs.create_continent(%{name: "Europe", coordinates: europe_coordinates})

north_america_coordinates =
  "priv/north_america.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

Jobs.create_continent(%{name: "North America", coordinates: north_america_coordinates})

south_america_coordinates =
  "priv/south_america.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

Jobs.create_continent(%{name: "South America", coordinates: south_america_coordinates})

oceania_coordinates = "priv/oceania.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

Jobs.create_continent(%{name: "Oceania", coordinates: oceania_coordinates})

job_offers_file
|> Enum.map(fn job_offer ->
  latitude =
    if job_offer["office_latitude"] == "" do
      0
    else
      job_offer["office_latitude"]
      |> String.to_float()
    end

  longitude =
    if job_offer["office_longitude"] == "" do
      0
    else
      job_offer["office_longitude"]
      |> String.to_float()
    end

  Jobs.create_job_offer(%{
    name: job_offer["name"],
    profession_id: job_offer["profession_id"],
    contract_type_id: contract_types[job_offer["contract_type"]],
    coordinate: %Geo.Point{coordinates: {longitude, latitude}, srid: 4326}
  })
end)
