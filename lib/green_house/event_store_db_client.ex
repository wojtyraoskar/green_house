defmodule MyApp.EventStoreDbClient do
  use Spear.Client,
    otp_app: :my_app
end
