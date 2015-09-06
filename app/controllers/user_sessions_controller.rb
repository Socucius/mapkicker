class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end


end
