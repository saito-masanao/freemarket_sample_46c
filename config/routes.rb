Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#sign_up'
  get 'top', to: 'users#top'
  get 'mypage', to: 'users#mypage'
  get 'profile', to: 'users#profile'
  get 'userconfirm', to: 'users#userconfirm'
  get 'userlogout', to: 'users#userlogout'
  get 'credit', to: 'users#credit'
  get 'creditregistration', to: 'users#creditregistration'
  get 'itemsell', to: 'users#itemsell'
  get 'itemdetail', to: 'users#itemdetail'
  get 'itemconfirm', to: 'users#itemconfirm'
  get 'sign_up', to: 'users#sign_up'
end
