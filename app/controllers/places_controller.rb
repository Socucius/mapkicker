class PlacesController < ApplicationController
  after_action :verify_authorized, only: [:create, :destroy, :update]

  def create
    place = current_user.places.build(place_params)
    authorize(place)
    place.save
    redirect_to current_user
  end

  def destroy
    place = Place.find(params[:id])
    authorize(place)
    place.destroy
    redirect_to current_user
  end

  def edit
    @place = Place.find(params[:id])
    respond_to do |format|
      format.js { render partial: "edit_form", layout: false }
    end
  end

  def update
    @place = Place.find(params[:id])
    authorize(@place)
    @place.update_attributes(place_params)
    redirect_to current_user
  end



  def show
    @place = Place.find(params[:id])
    respond_to do |format|
      format.js { render partial: "place", layout: false }
    end
  end

private

  def place_params
    params.require(:place).permit(:title, 
                                  :coordinates,
                                  :content,
                                  :image )
  end

end
