defmodule GreenHouse.Common.Events.Publisher do
  def publish(%{topic: event_name} = event) do
    [Spear.Event.new(event_name, event)]
    |> Spear.append(GreenHouse.EventStoreDbClient, event_name)

    :ok
  end

  def publish(), do: :empty
end
