Rails.application.routes.draw do

  root 'homes#top'
  get 'about' => 'homes#about'
  get 'admin_top' => 'homes#admin_top'
  get 'prefecture_search' => 'searches#prefecture_search'
  get 'occupation_search' => 'searches#occupation_search'


  #company側ルーティング
  devise_for :companies,skip: [:passwords], controllers: {
  registrations: "company/registrations",
  sessions: 'company/sessions'
  }

  devise_scope :company do
    post 'company/guest_sign_in', to: 'company/sessions#guest_sign_in'
  end

  namespace :company do
    resources :companies, only: [:show, :edit, :update] do
      resource :favorites, only: [:create, :destroy]
    end
    get '/companies/:id/unsubscribe' => 'companies#unsubscribe', as: 'unsubscribe'
    patch '/companies/:id/withdraw' => 'companies#withdraw', as: 'withdraw'
    resources :rooms, only: [:index, :show] do
      resources :messages, only: [:index, :create]
    end
    resources :notifications, only: [:index]
    delete 'destroy_all/notifications' => 'notifications#destroy_all'
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

  devise_scope :user do
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  namespace :user do
    resources :users, only: [:show, :edit, :update]
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :rooms, only: [:index, :show, :create] do
      resources :messages, only: [:index, :create]
    end
    resources :notifications, only: [:index]
    delete 'destroy_all/notifications' => 'notifications#destroy_all'
    patch 'user' => 'user#update'
    resources :posts, only: [:index, :show]
    resources :favorites, only: [:index]
  end




  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admin/sessions#guest_sign_in'
  end

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :show]
    resources :companies, only: [:index, :edit, :update, :show]
    resources :posts, only: [:index, :show, :destroy]
    resources :occupation_genres, only: [:index, :create, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
