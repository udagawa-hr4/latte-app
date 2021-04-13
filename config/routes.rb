Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show,:edit,:destroy,:update]
  root to: "tweets#index"
  resources :tweets do

    collection do
      get 'search'
      get 'list'
      get 'best'
    end
    resources :comments, only: [:create,:update,:destroy,:edit]
  end
end
