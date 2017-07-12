Rails.application.routes.draw do
  resources :todoroutes
  resources :segments
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :sources
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
