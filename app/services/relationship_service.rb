class RelationshipService
  attr_reader :followed_id
  def initialize(current_user, followed_id)
    @current_user = current_user
    @followed_id = followed_id
  end

  def save
    Relationship.create(
      follower_id: @current_user.id,
      followed_id: @followed_id
    )
  end

end
