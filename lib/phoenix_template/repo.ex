defmodule PhoenixTemplate.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_template,
    adapter: Ecto.Adapters.SQLite3
end
