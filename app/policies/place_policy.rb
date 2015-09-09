class PlacePolicy < ApplicationPolicy

  attr_reader :user, :place

  def initialize(user, place)
    @user = user
    @place = place
  end

  def destroy?
    @place.owner?(@user)
  end

  def create?
    #just in case
    @user == place.user
  end

  def update?
    @user == place.user
  end


end
