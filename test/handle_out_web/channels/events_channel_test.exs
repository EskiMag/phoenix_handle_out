defmodule HandleOutWeb.EventsChannelTest do
  use HandleOutWeb.ChannelCase

  test "event should not be received" do
    {:ok, socket} = connect(HandleOutWeb.UserSocket, %{})
    {:ok, _, socket} = subscribe_and_join(socket, "events", %{})

    ref = push(socket, "event-in", %{})
    assert_reply(ref, :ok)

    :erlang.process_info(self(), :messages) |> IO.inspect(label: "\n\nmailbox")

    refute_push("event-out", _)
    refute_broadcast("event-out", _)
  end
end
