defmodule ConsumirApi do

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.github.com"
  plug Tesla.Middleware.JSON

  def user_repos(login) do
    get("/users/" <> login <> "/repos")
  end
  
  @moduledoc """
  Documentation for ConsumirApi.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ConsumirApi.hello()
      :world

  """
  def hello do
    :world
  end
end
