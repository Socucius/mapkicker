class PlacesController < ApplicationController

  def create
    place = Place.new(strong_places_params)
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

  def strong_places_params
    params.require(:place).permit(:title, :coordinates)
  end

end
