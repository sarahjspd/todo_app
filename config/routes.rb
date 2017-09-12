Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "tasklists#index"

  resources :tasklists, only: [:show, :index, :new, :create, :edit, :update, :destroy] do

  	resources :tasks, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  	

  end

end
