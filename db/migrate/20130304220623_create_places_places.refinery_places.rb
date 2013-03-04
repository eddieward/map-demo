# This migration comes from refinery_places (originally 1)
class CreatePlacesPlaces < ActiveRecord::Migration

  def up
    create_table :refinery_places do |t|
      t.string :title
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :image_id
      t.boolean :show
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-places"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/places/places"})
    end

    drop_table :refinery_places

  end

end
