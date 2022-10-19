defmodule GreenHouse.Model.DoorBellConsumer do
  def consume(event) do
    # Call infrastructure to save data in db
    IO.inspect(event)
  end
end
