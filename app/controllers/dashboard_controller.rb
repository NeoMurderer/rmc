class DashboardController < ApplicationController
  def index
    authorize! :read, :dashboard
    gon.token = current_user.single_access_token
  end
end
