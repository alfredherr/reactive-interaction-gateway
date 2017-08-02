defmodule Gateway.Transports.ServerSentEvents.EncoderTest do
  use ExUnit.Case
  alias Phoenix.Socket.Message

  import Gateway.Transports.ServerSentEvents.Encoder, only: [format: 2]

  test "a full message" do
    msg = %Message{
      ref: "123",
      topic: "rooms:lobby",
      event: "some:event",
      payload: %{user: "foo", body: "bar"}
    }
    actual = format(msg)
    expected = """
               id: 123
               event: some:event
               data: {"topic":"rooms:lobby","payload":{"user":"foo","body":"bar"}}

               """
    assert actual == expected
  end

  test "a message without ref" do
    msg = %Message{
      topic: "rooms:lobby",
      event: "some:event",
      payload: %{user: "foo", body: "bar"}
    }
    actual = format(msg)
    expected = """
               event: some:event
               data: {"topic":"rooms:lobby","payload":{"user":"foo","body":"bar"}}

               """
    assert actual == expected
  end

  test "a message without event" do
    msg = %Message{
      ref: "123",
      topic: "rooms:lobby",
      payload: %{user: "foo", body: "bar"}
    }
    actual = format(msg)
    expected = """
               id: 123
               data: {"topic":"rooms:lobby","payload":{"user":"foo","body":"bar"}}

               """
    assert actual == expected
  end

  test "an empty message" do
    msg = %Message{}
    actual = format(msg)
    expected = """

               """
    assert actual == expected
  end
end
