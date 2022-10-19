defmodule GreenHouse.Door.Model.Events.ButtonPressedEvent do
  @event_name "ButtonPressedEvent"
  @derive Jason.Encoder
  defstruct [:timestamp, :type, topic: @event_name]
end
