Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions' }
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  namespace :admin do
    resources :users, only:[:index, :destroy]
    resources :reports, only:[:index, :destroy]
  end

  scope module: :public do
    root to: "homes#top"
    resources :pops, only:[:new, :index, :create, :show, :edit, :update, :destroy] do
      collection do
        get :only_followings
        get :search
      end
      resources :comments, only:[:create, :destroy]
      resource :favorites, only:[:create, :destroy]
    end
    resources :users, only: [:index, :show] do
      collection do
        get :search
      end
      resource :profiles, only:[:edit, :update]
      resource :relationships, only: [:create, :destroy]
      resources :reports, only:[:new, :create] do
        collection do
          get :success
        end
      end
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get 'chat/:id' => 'chats#show', as: 'chat'
    resources :chats, only: [:create]
    resources :notifications, only:[:index]
    resources :parties, only:[:new, :create, :index, :show, :edit, :update] do
      member do
        put :join
        put :withdraw
      end
    end
  end
end