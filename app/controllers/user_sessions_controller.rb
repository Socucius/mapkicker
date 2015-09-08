class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      render :new
    else
      redirect_to @user
    end
  end

  def destroy
    logout
    redirect_to root_path
  end


end
