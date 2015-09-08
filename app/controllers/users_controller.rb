class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @place = Place.new
    gon.places = current_user.places.as_json(only: [:id,:title, :coordinates])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :password, :password_confirmation)
  end

end
