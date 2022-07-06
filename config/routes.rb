Rails.application.routes.draw do

  root 'homes#top'
  get 'about' => 'homesabout'


  #company側ルーティング
  devise_for :companies,skip: [:passwords], controllers: {
  registrations: "company/registrations",
  sessions: 'company/sessions'
  }

  scope module: :company do
    get 'company/mypage' => 'companies#show'
    get 'company/edit' => 'companies#edit'
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
    get 'user/mypage' => 'users#show'
    get 'user/edit' => 'users#edit'
    patch 'user' => 'user#update'
    resources :posts, only: [:index, :show]
    get 'company/show' => 'companies#show'
  end




  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
