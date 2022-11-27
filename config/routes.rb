Rails.application.routes.draw do
  root 'orders#index'

  resources :orders, only: %i[index new create]
end
