# JobsManager

## To start the application: 

- `docker build -t jobs_manager .`
- `docker-compose up`
- wait a little bit for the database initialization after that you can start testing

## If you want to start in interactive elixir:
- `docker run -it -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres mdillon/postgis`
- `mix ecto.reset` (to init the database if you run it for the first time)
- `iex -S mix phx.server`

## Endpoints

Port for the application is 4000

`GET` request

- `localhost:4000/api/job_offers/count` - returns the count of job offers per profession category per continent.

- `localhost:4000/api/job_offers/radius?lat=40.7805&lon=-2.6147&radius=100` - returns the job offers with the proximity to these offers around a given location and a given radius around this location. Values that are set for arguments - `lat`, `lon`, `radius` are just for example.

## To run the tests

- `docker run -it -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres mdillon/postgis`
- `MIX_ENV=test mix ecto.create`
- `MIX_ENV=test mix ecto.migrate`
- `mix test`