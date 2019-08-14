Rails.application.routes.draw do
	  root 'users#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    resources :admin_categories, only: [:new, :create, :destroy, :index]
    resources :users, only: [:index, :edit, :show, :update]
    resources :skills, only: [:new, :edit, :create, :update, :destroy]
    resources :relationships, only: [:create, :destroy]
    resources :parties, only: [:new, :edit, :show, :create, :destroy]

    get 'chat/', to: 'chats#show'



end
