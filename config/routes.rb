EnjuIr::Engine.routes.draw do
  resources :collections
  resources :import_requests
  resources :filesets
  resources :datasets

  root 'datasets#index'
end
