Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get   'cocktails', to: 'cocktails#index'

  # post  'cocktails', to: 'cocktails#create'
  # get   'cocktails/new', to: 'cocktails#new', as: 'new_cocktail'

  # get   'cocktails/:id', to: 'cocktails#show', as: 'cocktail'

  # get   'cocktails/:id/doses/new', to: 'doses#new', as: 'new_dose'
  # post  'cocktails/:id/doses', to: 'doses#create'

  # root to:'cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

  delete 'doses/:id', to: 'doses#destroy', as: 'dose'
end
