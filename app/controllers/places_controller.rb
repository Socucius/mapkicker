class PlacesController < ApplicationController

  def create
    place = current_user.places.build(place_params)
    place.save
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
    respond_to do |format|
      format.html {redirect_to root_path }
      format.js
    end
  end

private

  def place_params
    params.require(:place).permit(:title, :coordinates)
  end

end
