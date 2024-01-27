Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :countries, only: [:index, :show, :create, :update, :destroy] do
        get "details", on: :collection, to: "countries#countries_with_details"
        get "states", on: :member, to: "countries#get_states"
      end
      resources :states, only: [:index, :show, :create, :update, :destroy] do
        get "cities", on: :member, to: "states#get_cities"
      end
      resources :cities, only: [:index, :show, :create, :update, :destroy] do
      end

      resources :contacts, only: [:index, :show, :create, :update, :destroy]

    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "" => "rails/welcome#index", as: :rails_welcome

  namespace :web do
    get "demo", to: "demo#index"
  end

end
