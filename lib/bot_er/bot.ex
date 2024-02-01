defmodule BotEr.Bot do
  use Telegram.Bot
  require Logger

  @impl Telegram.Bot
  def handle_update(%{"message" => msg}, token) do
    # expected text and chat ids
    {:ok, %{"username" => own_username}} = Telegram.Api.request(token, "getMe")
    full_cmd = "/open@#{own_username}"
    chat_id = Application.fetch_env!(:bot_er, :telegram_chat_id)

    case msg do
      # allow
      %{"text" => text, "chat" => %{"id" => ^chat_id}, "from" => %{"first_name" => name}, "message_id" => message_id}
        when text == "/open" or text == full_cmd ->
        Telegram.Api.request(token, "sendMessage",
          chat_id: chat_id,
          reply_to_message_id: message_id,
          text: "Opening door for #{name}"
        )
        {:ok, _body} = BotEr.Hass.open_door() |> IO.inspect

      # deny
      _ -> :ok
    end
  end

  def handle_update(_update, _token) do
    # ignore unknown updates
    :ok
  end
end
