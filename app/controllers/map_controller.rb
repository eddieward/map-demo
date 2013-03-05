class MapController < ApplicationController

  before_filter :get_places

  def index
  end


  private

  def get_places
    @places = Refinery::Places::Place.all
  end
end
