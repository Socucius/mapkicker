class StaticPagesController < ApplicationController
  def index
    @place = Place.new
    gon.places = Place.all.as_json(only: [:id,:title, :coordinates])
  end
end
