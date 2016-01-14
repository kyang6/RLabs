Rails.application.routes.draw do
  resources :labs

  root 'labs#index'
  
end
