Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/:username', to: 'users/sessions#profile', as: 'user_profile'
    get 'login', to: 'users/sessions#new', as: 'login'
    get 'register', to: 'users/registrations#new', as: 'register'
  end
  resources :posts do
    member do
      patch :upvote
      patch :downvote
    end
  end
  root to: "posts#index"
end
