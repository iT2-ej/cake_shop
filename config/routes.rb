Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'homes/top'
  end
  devise_for :admin,controllers: {
    sessions: 'admin/sessions' , 
   }
   
 namespace :admin do
   root to: "homes#top"
   resources :genres
   resources :items
 end
  devise_for :customers,controllers: {
     sessions: 'public/sessions',
     registrations: 'public/registrations'
   }
   
  scope module: :public do
    root to: "homes#top"
    resources :items
   
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
