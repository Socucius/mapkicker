class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit



  private

  def redirect_if_authenticated
    redirect_to current_user if current_user
  end

  
end
