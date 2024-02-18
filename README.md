# Phoenix Template with DaisyUI and SQlite3

## Getting Started 

```bash
git clone 
cd project_name
mix deps.get

mix ecto.create
mix phx.server
```

## Setting Up SQLite3 with Fly
read: https://gist.github.com/Copser/af3bf28cf9ae4f42a358d7d0a19f8b5e

tldr:
1. `fly launch`, don't deploy
2. set `DATABASE_PATH` env var on the fly.toml based on mount
3. create volume: `fly volumes create myapp_data --size 1`
4. set correct source and destination for volume mount on fly.toml:

```
# fly.toml

+[mounts]
+ source = "myapp_data"
+ destination = "/data"

[env]
+ DATABASE_PATH = "/data/myapp_data/my_app_prod.db"
  PHX_HOST = "spicy-burrito-2702.fly.dev"
  PORT = "8080"
```

5. remove migration command

```
# fly.toml

-[deploy]
-  release_command = "/app/bin/migrate"
```

6. call migration in `Application.start/2`

```
# lib/my_app/application.ex

  def start(_type, _args) do
    # Run migrations
+    MyApp.Release.migrate()

    children = [
      #children...
    ]

    #Supervisor...
  end
```


To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
