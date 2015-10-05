WebsocketRails::EventMap.describe do
  subscribe :client_connected,    to: Ws::ClientsController, with_method: :client_connected
  subscribe :client_disconnected, to: Ws::ClientsController, with_method: :client_disconnected
  subscribe :connection_closed,   to: Ws::ClientsController, with_method: :connection_closed
end
