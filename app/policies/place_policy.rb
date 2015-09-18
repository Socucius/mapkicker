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
    @place.owner?(@user)
  end

  def update?
    @place.owner?(@user)
  end


end
