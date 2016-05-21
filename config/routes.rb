Rails.application.routes.draw do

  root 'welcome#index'
  mount_devise_token_auth_for 'User', at: 'api/auth', controllers: { registrations: "user/registrations", sessions:"user/sessions"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: {format: :json} do
     resources :cart, only: [:index, :create, :destroy], param: :ebook_id
     resources :ebooks, only: [:index, :show], param: :ebook_id
     resources :token, only: [:index]
     resources :titles, only: [:index]
  end
  match "api" => proc { [404, {}, ['Invalid API endpoint']] }, via: [:get,:post]
  match "api/*path" => proc { [404, {}, ['Invalid API endpoint']] }, via: [:get,:post]
  match '/*path' => 'welcome#index', via:[:get,:post]
end