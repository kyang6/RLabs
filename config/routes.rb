Rails.application.routes.draw do
  devise_for :users
  resources :labs

  root 'labs#index'
  
end
