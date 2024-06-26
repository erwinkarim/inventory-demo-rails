Rails.application.routes.draw do
  # for devise useres
  devise_for :users

  get 'pages/index'
  get 'settings', to: 'pages#settings'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: "pages#index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, controller: 'users', only: [:show, :destroy, :update] do
    collection do
      post :generate
    end
  end

  resources :inventories, controller: 'inventory' do
    collection do
      post :generate
    end
  end

end
