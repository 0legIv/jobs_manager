defmodule JobsManagerWeb.Router do
  use JobsManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JobsManagerWeb do
    pipe_through :api
  end
end
