Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :items,only: [:new, :create, :show] do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
  end
  root 'users#sign_up'
=======
  resources :items,only: [:new, :create]
  root 'items#top'
>>>>>>> YKKISKW/master
  get 'users/new'
  post 'users/create'
  get 'top', to: 'items#top'
  get 'mypage', to: 'users#mypage'
  get 'profile', to: 'users#profile'
  get 'userconfirm', to: 'users#userconfirm'
  get 'userlogout', to: 'users#userlogout'
  get 'credit', to: 'users#credit'
  get 'creditregistration', to: 'users#creditregistration'
  get 'itemconfirm', to: 'users#itemconfirm'
  get 'sign_up', to: 'users#sign_up'
  get 'itemsell', to: 'users#itemsell'
end
