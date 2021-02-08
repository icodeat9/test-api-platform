Rails.application.routes.draw do
  defaults format: :json do
    namespace :api do
      resources :entries, only: [:index, :create]
    end
  end

  match '*path', to: "application#handle_root_not_found", via: [:get, :post]
end
