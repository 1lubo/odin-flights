# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'flights#index'

  get '/flights', to: 'flights#index'
  get '/bookings/new', to: 'bookings#new'
  post '/bookings', to: 'bookings#create'
  get 'bookings/:id/', to: 'bookings#show', as: 'booking'

  get 'about', to: 'application#about'
end
