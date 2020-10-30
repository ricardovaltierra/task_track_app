Rails.application.routes.draw do
  root to: "static#home"

  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :tasks, only: [:index, :show, :create, :destroy, :update]
  resources :records, only: [:index, :show, :create, :destroy, :update]
end
