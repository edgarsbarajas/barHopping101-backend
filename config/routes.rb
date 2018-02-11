Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/api/lyft' => 'lyft#index'
  get '/api/eventbrite' => 'eventbrite#search'
  
    resources :twilio, only: [:create]

end
