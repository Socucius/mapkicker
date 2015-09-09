class RelationshipPolicy < ApplicationPolicy

  attr_reader :user, :relationship

  def initialize(user, relationship)
    @user = user
    @rel = relationship
  end

  def destroy?
    
  end

  def create?
    @rel.followed_id != user.id
  end

end
