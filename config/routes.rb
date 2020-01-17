Rails.application.routes.draw do
  resources :bloggers, only: [:index, :create, :new, :show]
  resources :posts, only: [:index, :create, :new, :show, :edit, :update]
  resources :destinations, only: [:index, :show]
end
