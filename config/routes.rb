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

    notify_to :users, with_devise: :users
  end

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :users, only: [:show, :edit]
    resources :groups

    concern :commentable do
      resources :comments, only: [:create, :update, :destroy]
    end

    resources :user_posts, concerns: :commentable
    resources :group_user_posts, concerns: :commentable
  end
end
