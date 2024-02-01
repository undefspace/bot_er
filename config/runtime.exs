import Config

config :bot_er,
  telegram_token: System.get_env("TG_TOKEN"),
  telegram_chat_id: System.get_env("TG_CHAT") |> String.to_integer,
  hass_token: System.get_env("HASS_TOKEN"),
  hass_host: System.get_env("HASS_HOST"),
  hass_entity: System.get_env("HASS_ENTITY")
