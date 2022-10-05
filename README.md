# GreenHouse

GreenHouse is just example project with few nice solutions that i find during work ;)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`


# Setup
- EventStoreDB
  docker run --name esdb-node -it -p 2113:2113 -p 1113:1113 \
      eventstore/eventstore:latest --insecure --run-projections=All
  
