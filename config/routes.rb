Rails.application.routes.draw do
  get 'health', to: 'application#health'
  resources :courses
  resources :careers
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
