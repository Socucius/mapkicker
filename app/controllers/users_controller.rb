class UsersController < ApplicationController
  before_action :redirect_if_authenticated, except: [:show, :followers, :subscriptions]
  before_action :initialize_user, only: [:show, :followers, :subscriptions]
  before_action :init_js_variables, only: [:show]

  def show
    @place = Place.new
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

  def followers
    @followers = @user.followers
    respond_to do |format|
      format.js { render partial: 'followers', layout: false }
    end
  end

  def subscriptions
    @subscriptions = @user.subscriptions
    respond_to do |format|
      format.js { render partial: 'subscriptions', layout: false }
    end
  end

  private

  def initialize_user
    params[:id] ? @user = User.find(params[:id]) : @user = User.find(params[:user_id])
  end

  def init_js_variables
    gon.places = @user.places.as_json(only: [:id,:title, :coordinates])
    users_hash = { user: @user.id, current_user: current_user ? current_user.id : -1 }
    gon.users = users_hash.to_json
  end

  def user_params
    params.require(:user).permit(:email, :nickname, :password, :password_confirmation)
  end

end
