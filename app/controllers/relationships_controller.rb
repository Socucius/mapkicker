class RelationshipsController < ApplicationController

  def create
    rel = RelationshipService.new(current_user, relationship_params[:followed_id])
    authorize(rel)
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
