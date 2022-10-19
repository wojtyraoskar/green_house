defmodule GreenHouse.Door.Subscriber.DoorBellSubscriber do
  use GenServer
  alias GreenHouse.Model.DoorBellConsumer

  def start_link(conn) do
    GenServer.start_link(__MODULE__, conn, name: __MODULE__)
  end

  @impl GenServer
  def init(_conn) do
    Spear.subscribe(
      GreenHouse.EventStoreDbClient,
      self(),
      "ButtonPressedEvent"
    )

    {:ok, %{}}
  end

  @impl GenServer
  def handle_info(
        %Spear.Event{
          type: _type,
          body: body
        } = _event,
        state
      ) do
    DoorBellConsumer.consume(body)

    {:noreply, state}
  end
end
