defmodule SlideDex do
  def start do
    make_static_dir
    SlideDex.Builder.all
    {:ok, _} = Plug.Adapters.Cowboy.http SlideDex.Server, []
  end

  defp make_static_dir do
    unless File.exists?("priv/static") do
      :ok = File.mkdir("priv")
      :ok = File.mkdir("priv/static")
    end
  end
end
