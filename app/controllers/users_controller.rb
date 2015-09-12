class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @place = Place.new
    init_js_variables
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

  def init_js_variables
    gon.places = @user.places.as_json(only: [:id,:title, :coordinates])
    users_hash = { user: @user.id, current_user: current_user ? current_user.id : -1 }
    gon.users = users_hash.to_json
  end 

  def user_params
    params.require(:user).permit(:email, :nickname, :password, :password_confirmation)
  end

end
