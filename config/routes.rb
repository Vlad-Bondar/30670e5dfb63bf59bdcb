Rails.application.routes.draw do
  namespace :api do
    resources :users
    get 'typeahead/:id', to: 'users#search'
  end
end
