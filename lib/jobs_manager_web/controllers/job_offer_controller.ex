defmodule JobsManagerWeb.JobOfferController do
  use JobsManagerWeb, :controller

  alias JobsManager.Jobs

  def job_offers_count(conn, _params) do
    job_offers_count = Jobs.count_job_offers_by_profession_continent()

    conn
    |> put_status(200)
    |> render("job_offers_count.json", job_offers_count: job_offers_count)
  end

  def job_offers_radius(conn, %{"lat" => lat, "lon" => lon, "radius" => radius})
      when not is_nil(lat) and not is_nil(lon) and not is_nil(radius) do
    lat = String.to_float(lat)
    lon = String.to_float(lon)
    radius = String.to_integer(radius)
    job_offers = Jobs.get_job_offers_in_radius(lat, lon, radius)

    conn
    |> put_status(200)
    |> render("job_offers.json", job_offers: job_offers)
  end

  def job_offers_radius(conn, _params) do
    conn
    |> put_status(400)
    |> render("error.json")
  end
end
