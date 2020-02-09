defmodule JobsManagerWeb.JobOfferView do
  use JobsManagerWeb, :view

  alias JobsManager.DistanceHelpers

  def render("job_offers_count.json", %{job_offers_count: job_offers_count}) do
    %{
      success: true,
      data: job_offers_count
    }
  end

  def render("job_offers.json", %{job_offers: job_offers}) do
    render_many(job_offers, __MODULE__, "job_offer.json", as: :data)
  end

  def render("job_offer.json", %{
        data: %{job_offer: job_offer, proximity: proximity, continent: continent}
      }) do
    %{
      name: job_offer.name,
      coordinate: %{
        lat: elem(job_offer.coordinate.coordinates, 1),
        lon: elem(job_offer.coordinate.coordinates, 0)
      },
      proximity_km: DistanceHelpers.m_to_km(proximity),
      continent: continent,
      contract_type: job_offer.contract_type.name,
      profession: job_offer.profession.name
    }
  end

  def render("error.json", _params) do
    %{
      success: false,
      error: "error"
    }
  end
end
