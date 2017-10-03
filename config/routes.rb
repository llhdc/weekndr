Rails.application.routes.draw do
  root 'events#show'

  get 'event', to: 'events#new_event'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
