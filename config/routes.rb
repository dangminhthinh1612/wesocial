Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks,
    controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope '/(:locale)', locale: /en|vi/ do
    devise_for :users, skip: :omniauth_callbacks , controllers: {
      sessions: "users/sessions",
      passwords: "users/passwords",
      registrations: "users/registrations",
      confirmables: "users/confirmables"
    }
  end

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :users, only: [:show, :edit]
    resources :groups do
      member do
        get "statistics"
      end
    end
    resources :user_posts, only: [:create, :edit, :destroy] do
      resources :votes, only: [:create, :destroy]
    end
    resources :group_user_posts
  end
end
