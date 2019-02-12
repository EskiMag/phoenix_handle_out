defmodule HandleOutWeb.EventsChannel do
  use Phoenix.Channel

  intercept ["event-out"]

  def join(_, _, socket) do
    {:ok, socket}
  end

  def handle_in("event-in", _, socket) do
    broadcast!(socket, "event-out", %{})

    {:reply, :ok, socket}
  end

  def handle_out("event-out", _msg, socket) do
    {:noreply, socket}
  end
end
