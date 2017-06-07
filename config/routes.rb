Rails.application.routes.draw do

  get 'home/index'

  root 'home#index'

  get 'welcome/index'

  get '/count', to: 'bricks#all'

  get '/lasttimestamp', to: 'bricks#lastitemtimestamp'
  get '/lastitem', to: 'bricks#lastitem'
  get 'bricks/new/:type_of_brick', to: 'bricks#new'
  resources :bricks

end
