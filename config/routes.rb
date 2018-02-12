Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/api/lyft' => 'lyft#cost_estimates'
  get '/api/eventbrite' => 'eventbrite#search'
  get 'api/eventbrite/venues/:id' => 'eventbrite#venue'

  resources :twilio, only: [:create]
end
