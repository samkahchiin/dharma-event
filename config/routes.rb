Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :events

    root to: "events#index"
  end

  root to: "events#index"
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
