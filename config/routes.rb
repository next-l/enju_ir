EnjuIr::Engine.routes.draw do
  resources :collections
  resources :filesets
  resources :datasets

  namespace :api do
    resources :datasets
  end

  root 'datasets#index'
end
