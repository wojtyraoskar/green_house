defmodule GreenHouse.Door.Subscriber.DoorBellSubscriberCopy do
  use GenServer
  alias GreenHouse.Model.DoorBellConsumer

  def start_link(conn) do
    GenServer.start_link(__MODULE__, conn, name: __MODULE__)
  end

  @impl GenServer
  def init(_conn) do
    # index = get_event_index(__MODULE__, "ButtonPressedEvent")

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
    # revision = Spear.Event.revision(event)
    DoorBellConsumer.consume(body)

    # save_event_index(__MODULE__, type, revision)

    {:noreply, state}
  end

  # def get_event_index(name) do
  #   EctoEventsCheckpoint
  #   |> where([ec], ec.event_name == ^name)
  #   |> Repo.one()
  #   |> case do
  #     nil ->
  #       0

  #     event_checkpoint ->
  #       event_checkpoint.index
  #   end
  # end

  # def save_event_index(name, index) do
  #   EctoEventsCheckpoint
  #   |> where([ec], ec.event_name == ^name)
  #   |> Repo.one()
  #   |> case do
  #     nil ->
  #       %EctoEventsCheckpoint{}

  #     checkpoint ->
  #       checkpoint
  #   end
  #   |> EctoEventsCheckpoint.changeset(%{
  #     event_name: name,
  #     index: index
  #   })
  #   |> Repo.insert_or_update()
  # end
end
