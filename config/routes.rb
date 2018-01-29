Rails.application.routes.draw do
  devise_for :users
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  get 'home/index'

  resources :petitions



  root to: 'petitions#index'
end
