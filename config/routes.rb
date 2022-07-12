Rails.application.routes.draw do


  root 'homes#top'
  get 'about' => 'homesabout'
  get 'prefecture_search' => 'searches#prefecture_search'
  get 'occupation_search' => 'searches#occupation_search'


  #company側ルーティング
  devise_for :companies,skip: [:passwords], controllers: {
  registrations: "company/registrations",
  sessions: 'company/sessions'
  }

  namespace :company do
    resources :companies, only: [:show, :edit, :update] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :rooms, only: [:index, :show] do
      resources :messages, only: [:index, :create]
    end
    patch 'company' => 'companies#update'
    resources :posts, only: [:index, :show, :new, :edit, :update, :create, :destroy] do
      resource :likes, only: [:create, :destroy]
    end
    get 'user/show' => 'users#show'
  end


  #user側ルーティング
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  namespace :user do
    resources :users, only: [:show, :edit, :update]
    resources :rooms, only: [:index, :show, :create] do
      resources :messages, only: [:index, :create]
    end
    patch 'user' => 'user#update'
    resources :posts, only: [:index, :show]
    resources :favorites, only: [:index]
  end




  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
