Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"

  resources :caterers, except: %i[destroy edit update] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[destroy update index delete]
  get 'bookings/:id/accept', to: 'bookings#accept', as: 'accept'

  resources :pages, only: %i[dashboard]
end
