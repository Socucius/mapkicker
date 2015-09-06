class StaticPagesController < ApplicationController
  def index
    @place = Place.new
    gon.places = current_user.places.as_json(only: [:id,:title, :coordinates])
  end
end
