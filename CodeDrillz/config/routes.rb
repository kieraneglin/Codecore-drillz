Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
  devise_for :users
  # , ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  resources :groups do
    resources :drills
  end
  resources :categories
end
