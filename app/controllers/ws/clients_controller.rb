module Ws
  class ClientsController < WebsocketRails::BaseController
    def client_connected
      user = User.find_by_single_access_token params[:client_token]
      WebsocketRails.users[user.id] = connection
    end

    def client_disconnected
      # known_connections = WebsocketRails.users[client_id]
      # known_connections.connections.delete connection
      # Rails.logger.debug '#######' + params.inspect
    end

    def connection_closed
      # Rails.logger.debug '#######' + params.inspect
    end
  end
end
