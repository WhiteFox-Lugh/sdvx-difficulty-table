Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'table' => 'table#index'
  get '/table/:lv', to: 'table#list', as: :table_lv
  get 'top/index'
  root 'top#index'
end
