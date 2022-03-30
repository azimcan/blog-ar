Rails.application.routes.draw do
  root 'posts#index'
  
  # resources :posts
  # resources :comments

  resources :posts do
    resources :comments
  end

  resources :users, expect: %i[index]


end
