defmodule Mix.Tasks.MixConsumirApiBitcoin  do
    
    use Mix.Task

    def run(_) do
        Application.ensure_all_started(:hackney)
        ConsumirApiBitcoin.currency
    end
end