module Refinery
  module Places
    module Admin
      class PlacesController < ::Refinery::AdminController

        crudify :'refinery/places/place', :xhr_paging => true

      end
    end
  end
end
