class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_authorization_check

  def fire
    user = authorize params
    if user
      notify user, params
      render nothing: true, status: :ok
    else
      render nothing: true, status: :forbidden
    end
  end
  private

  def authorize(params)
    user_session = UserSession.new user_session_params
    if user_session.save
      current_user
    else
      nil
    end
  end

  def notify(user, params)
    connection = WebsocketRails.users[user.id]

    Rails.logger.error '###############################'
    Rails.logger.error params
    Rails.logger.error '###############################'
    connection.send_message :fired, { action: params['user_action'],params: params['user_data']  }
  end

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
