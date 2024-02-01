defmodule BotEr.Hass do
  use Tesla

  defp config do
    url = "http://#{Application.fetch_env!(:bot_er, :hass_host)}:8123"
    token = Application.fetch_env!(:bot_er, :hass_token)
    entity = Application.fetch_env!(:bot_er, :hass_entity)
    {url, token, entity}
  end

  plug Tesla.Middleware.JSON

  def open_door do
    {url, token, entity} = config()
    client = Tesla.client([
      {Tesla.Middleware.BearerAuth, token: token}
    ])

    post(client, "#{url}/api/services/button/press", %{"entity_id" => entity})
  end
end
