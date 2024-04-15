Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Add the new API routes here
  namespace :api do
    namespace :v1 do
      resources :earthquakes, only: [:index] do
        resources :comments, only: [:index, :create, :update, :destroy], param: :id do
          member do
            put :update
          end
        end
      end

      resources :earthquakes, only: [] do
        resources :seismic_features, only: [:index]
      end
    end
  end

  # ... (other routes)
end