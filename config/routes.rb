Rails.application.routes.draw do
  devise_for :admin

  devise_for :customers
  # devise_for :admins,controllers: {
  #  sessions: 'admin/sessions'
  # }

  # devise_for :customers,controllers: {
  #   sessions: 'public/sessions',
  #   registrations: 'public/registrations'
  # }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
