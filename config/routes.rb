Rails.application.routes.draw do
  root to: "homes#top"
  get :about, to: "homes#about"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  devise_for :admin_users, skip: [:registrations], controllers: {
    sessions: "admin_users/sessions",
  }

  namespace :admin do
    resources :posts
  end

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show] do
    resources :followed_users, only: [:index] # Aさんがフォロされている人の一覧
    resources :following_users, only: [:index] # Aさんがフォロしている人の一覧
    resource :follows, only: [:create, :destroy]
  end
end
