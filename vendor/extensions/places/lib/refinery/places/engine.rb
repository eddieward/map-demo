module Refinery
  module Places
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Places

      engine_name :refinery_places

      initializer "register refinerycms_places plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "places"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.places_admin_places_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/places/place'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Places)
      end
    end
  end
end
