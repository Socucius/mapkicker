class RelationshipsController < ApplicationController

  def create
    rel = Relationship.new(relationship_params)
    authorize(rel)
    rel.follower_id = current_user.id
    rel.save
    redirect_to current_user
  end

  def destroy
    
  end

  def subscribers
    @followers = current_user.get_followers
    respond_to :js
  end

  def subscriptions
    @subscriptions = current_user.get_subscriptions
    respond_to :js
  end

  private

  def relationship_params
    params.require(:relationship).permit(:followed_id)
  end

end
