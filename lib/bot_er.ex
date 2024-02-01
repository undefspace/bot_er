defmodule BotEr do
  use Application

  def start(_start_type, _start_args) do
    bot_config = [
      token: Application.fetch_env!(:bot_er, :telegram_token),
      max_bot_concurrency: 1
    ]

    Supervisor.start_link([
      {Telegram.Poller, bots: [{BotEr.Bot, bot_config}]},
    ], strategy: :one_for_one, name: __MODULE__)
  end
end
