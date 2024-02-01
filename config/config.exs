import Config

config :tesla,
  adapter: {Tesla.Adapter.Hackney, [recv_timeout: 40_000]}
