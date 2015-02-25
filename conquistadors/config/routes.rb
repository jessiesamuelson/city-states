Rails.application.routes.draw do


  # resources :countries

  post'/login' => :login, controller: :players
  delete '/login' => :logout, controller: :players
  resources :players do
    # get ':param' => :show, on: :member
    resources :countries
  end

  root to: 'static#index'

end
