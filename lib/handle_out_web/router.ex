defmodule HandleOutWeb.Router do
  use HandleOutWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HandleOutWeb do
    pipe_through :api
  end
end
