Rails.application.routes.draw do


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
    patch '/customers/withdraw' => 'customers#withdraw',as: 'withdraw'
    get '/about' => 'homes#about'
    resources :items
    get '/customers/information/edit' => 'customers#edit',as: 'edit_information'
    get '/customers/my_page' => 'customers#show',as: 'my_page'
    patch '/customers/information/edit' => 'customers#update',as: 'edit_update'
    get '/customers/unsubscribe' => 'customers#unsubscribe',as: 'unsubscribe'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
