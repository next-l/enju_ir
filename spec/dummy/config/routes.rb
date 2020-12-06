Rails.application.routes.draw do
  mount EnjuIr::Engine => "/enju_ir"
  devise_for :users
end
