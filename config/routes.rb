Rails.application.routes.draw do
  resources :foos
  root 'foos#index'
end
