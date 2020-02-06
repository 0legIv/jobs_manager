defmodule JobsManager.Repo do
  use Ecto.Repo,
    otp_app: :jobs_manager,
    adapter: Ecto.Adapters.Postgres
end
