Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  # mount ActiveAdmin::Engine => '/admin
  ActiveAdmin.routes(self)
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    # sessions: 'custom_sessions'
  }
  # mount ActiveAdmin::Engine => '/admin

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get "/users_post", to: "posts#users_post" 
  # get "/user/:id/posts", to: "posts#users_post"


  # ActiveAdmin.routes(self, path: '/admin')
  # root to: 'post_controller#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
