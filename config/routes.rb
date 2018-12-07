Rails.application.routes.draw do

  resources :documents
  #root :to => "home#index"
  # root :to => 'sessions#new'
  root 'sessions#new'
  
  resources :users

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'

  post   'upload_documents'   => 'uploads#documents'

end
