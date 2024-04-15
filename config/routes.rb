Rails.application.routes.draw do
  # ... (other routes)

  namespace :api do
    namespace :v1 do
      resources :earthquakes, only: [:index] do
        resources :comments, only: [:index, :create, :update], param: :id
        collection do
          match '/', action: 'options_request', via: [:options]
        end
      end

      resources :earthquakes, only: [] do
        resources :seismic_features, only: [:index]
      end
    end
  end

  # ... (other routes)
end