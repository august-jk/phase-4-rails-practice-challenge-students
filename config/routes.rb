Rails.application.routes.draw do
  resources :instructors, only: [:index, :show, :create, :destroy, :update]
  resources :students, only: [:index, :show, :create, :destroy, :update]
end
