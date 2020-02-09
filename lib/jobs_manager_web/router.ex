defmodule JobsManagerWeb.Router do
  use JobsManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JobsManagerWeb do
    pipe_through :api

    get("/job_offers/count", JobOfferController, :job_offers_count)
    get("/job_offers/radius", JobOfferController, :job_offers_radius)
  end
end
