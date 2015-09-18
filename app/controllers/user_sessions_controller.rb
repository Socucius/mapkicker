class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to @user
    else
      flash.now[:error] = "Неправильные логин и пароль"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end


end
