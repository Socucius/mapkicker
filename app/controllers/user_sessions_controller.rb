class UserSessionsController < ApplicationController
  before_action :redirect_if_authenticated

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end


end
