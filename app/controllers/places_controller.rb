class PlacesController < ApplicationController

  def create
    place = current_user.places.build(place_params)
    place.save
    redirect_to current_user
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    respond_to do |format| 
      format.html { redirect_to place.user }
    end
  end

  def edit
    @place = Place.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    redirect_to @place.user
  end



  def show
    @place = Place.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

private

  def place_params
    params.require(:place).permit(:title, :coordinates, :content)
  end

end
