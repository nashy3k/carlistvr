Rails.application.routes.draw do
  root                 'static_pages#home'  
  get    'help'     => 'static_pages#help'
  get    'about'    => 'static_pages#about'
  get    'contact'  => 'static_pages#contact'
  get    'signup'   => 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :listings,          only: [:create, :destroy, :show, :new, :index, :edit, :update]
  # resources :relationships,       only: [:create, :destroy]
  resources :videos, only: [:index, :new, :create]

end