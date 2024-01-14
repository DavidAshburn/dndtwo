Rails.application.routes.draw do
  root 'home#index'
  get 'labels/dropdowns'
  get 'labels/initPC'

  resources :characters
  resources :races, param: :name, only: [ :show ]
  resources :subraces, param: :name, only: [ :show ]
  resources :player_classes, param: :name, only: [ :show ]
  resources :subclasses, param: :name, only: [ :show ]
  resources :backgrounds, param: :name, only: [ :show ]
  resources :class_spell_lists, param: :name, only: [ :show ]
  resources :weapons, param: :wep_type, only: [ :show ]
end
