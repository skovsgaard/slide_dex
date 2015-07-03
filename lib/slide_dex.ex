defmodule SlideDex do
  def start do
    SlideDex.Builder.all
    {:ok, _} = Plug.Adapters.Cowboy.http SlideDex.Server, []
  end
end
