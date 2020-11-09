Rails.application.routes.draw do
  root 'static_pages#top'
  get '/login', to: 'users#new'
  resources :users
end
