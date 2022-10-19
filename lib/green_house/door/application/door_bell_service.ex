defmodule GreenHouse.Door.Application.DoorBellService do
  alias GreenHouse.Door.Model.Events.ButtonPressedEvent
  alias GreenHouse.Common.Events.Publisher

  def click() do
    Publisher.publish(%ButtonPressedEvent{
      timestamp: :os.system_time(:second),
      type: :main_door
    })
  end
end
