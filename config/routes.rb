Rails.application.routes.draw do
  resources :encounters
  resources :patients
  root 'patients#index'
end
