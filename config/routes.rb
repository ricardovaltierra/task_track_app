Rails.application.routes.draw do
  root to: "static#home"

  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  resources :sessions, only: [:create]
  resources :registrations, only: [:create, :destroy]

  delete :reset, to: "tasks#destroy"

  resources :tasks, only: [:index, :show, :create, :update]

  resources :records, only: [:index, :show, :create, :destroy, :update]
end
