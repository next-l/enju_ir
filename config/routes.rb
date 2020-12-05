EnjuIr::Engine.routes.draw do
  resources :collections
  resources :filesets
  resources :datasets

  root 'datasets#index'
end
