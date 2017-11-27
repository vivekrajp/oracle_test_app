Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'contacts#index'

  resources :contacts do
  	resources :contact_address
  	resources :contact_phone_numbers
  end
end
