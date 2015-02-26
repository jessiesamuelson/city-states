Rails.application.routes.draw do

  resources :trade_deals

  # get '/blah' => 'static#blah'
  root to: 'static#index'

  # resources :countries

  post '/login' => :login, controller: :players
  delete '/login' => :logout, controller: :players
  resources :players do
    # get ':param' => :show, on: :member
    resources :countries
  end

  

end
