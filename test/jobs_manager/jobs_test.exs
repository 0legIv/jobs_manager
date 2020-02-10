defmodule JobsManager.JobsTest do
  use JobsManager.DataCase

  alias JobsManager.Jobs

  @africa_lon 21.77538
  @africa_lat 13.43930

  @africa_lon2 20.3741
  @africa_lat2 11.8458

  @europe_lon 4.19197
  @europe_lat 46.77696

  setup do
    africa_coordinates =
      "priv/africa.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

    {:ok, continent} = Jobs.create_continent(%{name: "Africa", coordinates: africa_coordinates})

    {:ok, contract_type} = Jobs.create_contract_type(%{name: "test_contract"})
    {:ok, category} = Jobs.create_category(%{name: "test_category"})

    {:ok, profession} =
      Jobs.create_profession(%{
        name: "Test profession",
        category_id: category.id
      })

    %{
      continent: continent,
      contract_type: contract_type,
      category: category,
      profession: profession
    }
  end

  test "create_job_offer creates new job offer with continent id", %{
    continent: continent,
    contract_type: contract_type,
    profession: profession
  } do
    job_offer_params = %{
      name: "Test job",
      profession_id: profession.id,
      contract_type_id: contract_type.id,
      coordinate: %Geo.Point{coordinates: {@africa_lon, @africa_lat}, srid: 4326}
    }

    {:ok, job_offer} = Jobs.create_job_offer(job_offer_params)
    assert job_offer.continent_id == continent.id
  end

  test "count_job_offers_by_profession_continent returns correct results", %{
    contract_type: contract_type,
    profession: profession
  } do
    europe_coordinates =
      "priv/europe.json" |> File.read!() |> Jason.decode!() |> Geo.JSON.decode!()

    Jobs.create_continent(%{name: "Europe", coordinates: europe_coordinates})

    Jobs.create_job_offer(%{
      name: "Test job",
      profession_id: profession.id,
      contract_type_id: contract_type.id,
      coordinate: %Geo.Point{coordinates: {@africa_lon, @africa_lat}, srid: 4326}
    })

    Jobs.create_job_offer(%{
      name: "Test job",
      profession_id: profession.id,
      contract_type_id: contract_type.id,
      coordinate: %Geo.Point{coordinates: {@europe_lon, @europe_lat}, srid: 4326}
    })

    assert %{"Test profession" => %{"Africa" => 1, "Europe" => 1}} ==
             Jobs.count_job_offers_by_profession_continent()
  end

  test "get_job_offers_in_radius returns correct result", %{
    contract_type: contract_type,
    profession: profession
  } do
    Jobs.create_job_offer(%{
      name: "Test job",
      profession_id: profession.id,
      contract_type_id: contract_type.id,
      coordinate: %Geo.Point{coordinates: {@africa_lon, @africa_lat}, srid: 4326}
    })

    Jobs.create_job_offer(%{
      name: "Test job2",
      profession_id: profession.id,
      contract_type_id: contract_type.id,
      coordinate: %Geo.Point{coordinates: {@africa_lon2, @africa_lat2}, srid: 4326}
    })

    assert 1 == Jobs.get_job_offers_in_radius(13.1972, 21.2256, 70) |> length
    assert 2 == Jobs.get_job_offers_in_radius(13.1972, 21.2256, 185) |> length
  end
end
