Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'search', to: 'search#index'
  get 'search/index'
  get 'search/search'
  get 'search/result'

  get 'result', to: 'result#index'
  get 'result/index'
end
