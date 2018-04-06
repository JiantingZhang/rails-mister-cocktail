Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
  resources :doses, only: [:new, :create]
    # cocktails/3/doses/new
    # @dose.cocktail = cocktail that the dose belongs to
  end
  resources :doses, only: :destroy
  root to: 'cocktails#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

