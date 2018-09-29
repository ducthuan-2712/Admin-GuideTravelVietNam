class PlacesController < ApplicationController
  def new
    @place = Place.new
    @destinations = Destination.all
  end

end
