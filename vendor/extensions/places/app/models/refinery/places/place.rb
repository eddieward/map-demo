module Refinery
  module Places
    class Place < Refinery::Core::BaseModel
      self.table_name = 'refinery_places'

      attr_accessible :title, :description, :address, :latitude, :longitude, :image_id, :show, :position

      acts_as_indexed :fields => [:title, :description, :address]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
