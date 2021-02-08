Rails.application.routes.draw do
  defaults format: :json do
    namespace :api do
      resources :entries, only: [:index, :create]
    end
  end
end
