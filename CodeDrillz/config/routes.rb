Rails.application.routes.draw do

  resources :groups do
    resources :drills
  end
  resources :categories


end
