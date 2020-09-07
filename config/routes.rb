Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'table/update', to: 'table#update'
  get 'table/:lv', to: 'table#list', as: :table_lv
  get 'top/index'

  # login / logout
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/twitter', as: :login
  get '/logout', to: 'sessions#destroy'

  root 'top#index'
end
