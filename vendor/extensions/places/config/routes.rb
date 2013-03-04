Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :places do
    resources :places, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :places, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :places, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
