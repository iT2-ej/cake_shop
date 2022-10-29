Rails.application.routes.draw do
  devise_for :admin,controllers: {
    sessions: 'admin/sessions' , 
   }
   
 namespace :admin do
   resources :genres
   resources :items
 end
  devise_for :customers,controllers: {
     sessions: 'public/sessions',
     registrations: 'public/registrations'
   }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
