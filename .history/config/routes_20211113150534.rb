Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get  '/help',    to:  'static_pages#help' 
  get  '/about',   to:  'static_pages#about'
  get  '/contact', to:  'static_pages#contact'
  
  get  '/signup',  to:  'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers, :talks#talk一覧
    end

    collection do
      get :search
    end
  end

  

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :replies,             only: [:create, :destroy]
  
  resources :talks,               only: [:show, :create]
  #talk詳細　message一覧
  
  resources :messages,            only: [:create]
  #message_form
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
