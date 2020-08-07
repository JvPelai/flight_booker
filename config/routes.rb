Rails.application.routes.draw do
  resources :bookings
  resources :flights
  root 'flights#index'
end
