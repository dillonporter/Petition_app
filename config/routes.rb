Rails.application.routes.draw do
  devise_for :users

  get 'home/index'

  resources :petitions

  get 'petitions/(:id)/sign', to: 'petitions#sign', as: :sign_count

  root to: 'petitions#index'
end
