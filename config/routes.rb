Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'search', to: 'search#index'
  get 'search/index'
  get 'search/result'

  get 'search/out'
  get 'search/cards'
end
