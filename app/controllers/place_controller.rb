class PlaceController < ApplicationController

  def index

    @places = Refinery::Places::Place.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places }
    end

  end
end
