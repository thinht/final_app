Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  # resources :albums do
  #   resources :pictures
  # end

  # resources :users


  # shallow do
  resources :users, shallow: true do
    get 'dashboard', on: :member
    resources :albums do
      resources :pictures
    end
  end

  resources :pictures

  # end

  root 'home#index'
end



