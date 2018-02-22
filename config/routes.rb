Rails.application.routes.draw do
  get 'events/month'

  get 'events/:year/:month' => 'events#month'

  resources :events, only: [:create, :update, :destroy]

  match '*path', via: [:options], to:  lambda {|_| [204, {'Access-Control-Allow-Headers' => "Origin, Content-Type, Accept, Authorization, Token", 'Access-Control-Allow-Origin' => "*", 'Content-Type' => 'text/plain'}, []]}
end
