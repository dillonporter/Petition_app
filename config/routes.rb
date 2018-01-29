Rails.application.routes.draw do
  devise_for :users

  resources :petitions

  get 'petitions/(:id)/sign', to: 'petitions#sign', as: :sign_count

  root to: 'home#index'
end
