defmodule ElhexDelivery.TopSupervisor do
  @moduledoc false

  use Supervisor
  alias ElhexDelivery.PostalCode.StoreSupervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  # init/1
  def init(_) do
    children = [
      %{
        id: StoreSupervisor,
        start: {StoreSupervisor, :start_link, []}
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)  # init/2
  end
end
