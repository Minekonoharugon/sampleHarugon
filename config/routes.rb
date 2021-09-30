Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'harugon/index' => 'harugon#index'
  get 'harugon/link' => 'harugon#link'
  root 'harugon#index'
  resources :users, only: [:index, :show]
  resources :dogs do
    resources :likes, only: [:create, :destroy]
    resources :microposts, only: [:create, :destroy, :show] do
      resources :comments, only: [:create, :destroy]
    end
    resources :messages, :only => [:create]
    resources :rooms, :only => [:create, :show, :index]
  end
end
