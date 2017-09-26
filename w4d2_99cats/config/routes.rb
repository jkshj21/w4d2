Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  patch '/cat_rental_requests/:id', to: 'cat_rental_requests#approve', as: 'approve'
  # patch '/cat_rental_requests/:id' to: 'cat_rental_requests#deny' as: 'deny'


  resources :cats
  resources :cat_rental_requests
end
