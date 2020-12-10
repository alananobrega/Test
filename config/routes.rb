Rails.application.routes.draw do
  root 'messages#index'
  put 'archived_all', to: 'messages#destroy_all'
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
