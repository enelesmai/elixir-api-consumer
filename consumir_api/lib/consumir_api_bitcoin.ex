defmodule ConsumirApiBitcoin do

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://pro-api.coinmarketcap.com"
  plug Tesla.Middleware.Headers, [{"X-CMC_PRO_API_KEY", "8f771dd6-a9de-48dd-861b-c685ca39a221"}]
  plug Tesla.Middleware.JSON

  def currency do
    {:ok, response} = request()
    data(response)
    |> get_map_from_list
    |> create_message
    |> show_message
  end

  defp request do
    get("/v1/cryptocurrency/listings/latest")
  end

  defp data(response) do
    response.body["data"]
  end

  defp get_map_from_list(list) do
    list |> Enum.at 0
  end

  defp create_message(map) do
    "> #{map["name"]} (#{map["symbol"]}) tiene un precio actual de: #{map["quote"]["USD"]["price"]}"
  end

  defp show_message(message) do
    IO.puts message
  end

end
