defmodule ElhexDelivery.PostalCode.Store do
  @moduledoc false

  use GenServer
  alias ElhexDelivery.PostalCode.DataParser

  # GenServer.start_link starts the Store process, and that new process runs init/1
  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :postal_code_store)  # name of process
  end

  def init(_) do
    {:ok, DataParser.parse_data}  # reads the file and builds the map. Its now the "state".
  end

  def get_geolocation(postal_code) do
    GenServer.call(:postal_code_store, {:get_geolocation, postal_code})
  end

  # Callbacks

  def handle_call({:get_geolocation, postal_code}, _from, state) do
    geolocation = Map.get(state, postal_code)
    {:reply, geolocation, state}
  end
end
