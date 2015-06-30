class HomeController < ApplicationController
  def index
    @title = 'Login'
  end

  def auth
    # '24c00c9d-59ee-4a9a-9877-8b5f4ca874e9'
    auth = RdInsightly.create_authorization params[:key]
    session[:token] = auth.api_token
    redirect_to '/leads/index', key: params[:key]
  end

  def logout
    session[:token] = nil
    RdInsightly.logout
    redirect_to '/leads/index'
  end
end
