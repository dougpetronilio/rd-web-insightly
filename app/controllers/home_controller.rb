class HomeController < ApplicationController
  def index
    @title = 'Login'
  end

  def auth
    # '24c00c9d-59ee-4a9a-9877-8b5f4ca874e9'
    RdInsightly.create_authorization params[:key] 
    redirect_to '/leads/index', key: params[:key]
  end

  def logout
    RdInsightly.logout
    redirect_to '/leads/index'
  end
end
