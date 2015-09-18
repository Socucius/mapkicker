class RelationshipsController < ApplicationController

  def create
    rel = Relationship.new(relationship_params)
    authorize(rel)
    rel.follower_id = current_user.id
    rel.save
    redirect_to user_path(rel.followed_id)
  end

  def destroy
    
  end

  private

  def relationship_params
    params.require(:relationship).permit(:followed_id)
  end

end
