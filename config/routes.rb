Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :caterers, except: %i[destroy edit update] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[destroy update]
  resources :pages, only: %i[dashboard]
end
