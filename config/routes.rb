Rails.application.routes.draw do
  resources :carts
  get 'users/mypage/edit', to: 'users#edit'
  get 'users/mypage', to: 'users#mypage'
  patch '/users/mypage', to: 'users#update'
  devise_for :admin_users
  devise_for :users
  resources :products do
    resources :reviews, only: [:create, :update, :destroy]
    member do
      post :like
    end
  end
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
