module Refinery
  module Places
    class PlacesController < ::ApplicationController

      before_filter :find_all_places
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @place in the line below:
        present(@page)
      end

      def show
        @place = Place.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @place in the line below:
        present(@page)
      end

    protected

      def find_all_places
        @places = Place.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/places").first
      end

    end
  end
end
