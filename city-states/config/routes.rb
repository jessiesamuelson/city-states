Rails.application.routes.draw do


  post'/login' => :login, controller: :players
  delete '/login' => :logout, controller: :players
  resources :players do
    get ':param' => :show, on: :member
  end

  root to: 'static#index'
  
end
