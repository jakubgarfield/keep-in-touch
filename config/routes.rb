Rails.application.routes.draw do
  resources :friends
  resources :catchups, only: [:show] do
    member do
      get :postpone
      get :skip
      get :finalise
    end
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session

    root :to => 'friends#index'
  end
end
