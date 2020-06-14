Rails.application.routes.draw do
  resources :produits
  root "paniers#index"
  resources :paniers
end
