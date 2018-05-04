Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events

  get 'events/:id/registry', to: 'events#registry', as: :registry_to_event
  post 'events/:id/register', to: 'events#register', as: :register_to_event

  root to: 'events#index'
end
