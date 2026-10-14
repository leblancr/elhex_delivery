defmodule ElhexDelivery.PostalCode.StoreSupervisor do
  @moduledoc false

  use Supervisor
  alias ElhexDelivery.PostalCode.{Store, Navigator}

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  # init/1
  def init(_) do
    children = [
      %{
        id: Store,
        start: {Store, :start_link, []}
      },
      %{
        id: Navigator,
        start: {Navigator, :start_link, []}
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)  # init/2
  end
end
