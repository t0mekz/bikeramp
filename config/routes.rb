Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :trips, only: [:create]
      namespace :stats do
        get 'monthly', action: :index, controller: 'monthly'
      end
    end
  end
end
