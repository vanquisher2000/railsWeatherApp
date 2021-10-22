Rails.application.routes.draw do
  resources :search_logs
  get 'home/index'
  root "search_logs#index"
  get "search_logs/search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
