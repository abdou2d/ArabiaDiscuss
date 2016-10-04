Rails.application.routes.draw do
  resources :categories
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/:username', to: 'users/sessions#profile', as: 'user_profile'
    get 'users/:id/edit', to: 'users/registrations#edit', as: 'edit_user'
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
