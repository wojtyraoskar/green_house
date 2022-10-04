defmodule GreenHouse.Repo do
  use Ecto.Repo,
    otp_app: :green_house,
    adapter: Ecto.Adapters.Postgres
end
