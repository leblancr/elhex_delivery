defmodule ElhexDelivery.Application do
  @moduledoc false

    use Application

  def start(_type, _args) do
    ElhexDelivery.TopSupervisor.start_link
  end
end
