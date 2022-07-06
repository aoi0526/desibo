Rails.application.routes.draw do

  root 'homes#top'
  get 'about' => 'homesabout'


  #company側ルーティング
  devise_for :companies,skip: [:passwords], controllers: {
  registrations: "company/registrations",
  sessions: 'company/sessions'
  }

  scope module: :company do
    resources :companies, only: [:show, :edit, :update]
    patch 'company' => 'companies#update'
    resources :posts, only: [:index, :show, :new, :edit, :update, :create, :destroy]
    get 'user/show' => 'users#show'
  end


  #user側ルーティング
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  scope module: :user do
    resources :users, only: [:show, :edit, :update]
    patch 'user' => 'user#update'
    resources :posts, only: [:index, :show]
    resources :companies, only: [:show]
  end




  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
