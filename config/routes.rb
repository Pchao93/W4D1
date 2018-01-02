Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: :index
    resources :comments, only: :index
  end
  resources :artworks, only: [:create, :destroy, :index, :show, :update] do
    resources :comments, only: :index
  end
  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy, :index]
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show", as: "user"
  #
  # post "/users", to: "users#create"
  #
  # get "/users/new", to: "users#new", as: "new_user"
  #
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  #
  # patch "/users/:id", to: "users#update"
  #
  # put "/users/:id", to: "users#update"
  #
  # delete "/users/:id", to: "users#destroy"


end
