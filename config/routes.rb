Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {omniauth_callbacks:  "users/omniauth_callbacks", sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users/:id', to: 'users/omniauth_callbacks#show', as: 'user'
  root to: 'home#index'
  resources :thing
  resources :products do
    member do
      get 'add'
    end
	end

  resources :carts, only: :show do
    collection do
      put :add
      put :update
      delete :destroy
    end
  end
end
