Rails.application.routes.draw do

  #root :to => "home#index"
  root :to => 'sessions#new'
  resources :users
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'


end
