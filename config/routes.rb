
Rails.application.routes.draw do

  get 'charges/new'
  get 'charges/create'
  root 'welcome#index'
  mount_devise_token_auth_for 'User', at: 'api/auth', controllers: { registrations: "user/registrations",passwords:"user/passwords", sessions:"user/sessions" , confirmations:"user/confirmations",token_validations:"user/token_validations"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: {format: :json} do
     resources :cart, only: [:index, :create, :destroy], param: :ebook_id
     resources :ebooks, only: [:index, :show, :rand], param: :ebook_id
     resources :token, only: [:index]
     resources :titles, only: [:index]
     resources :charges, only: [:create,:new], param: :data
     resources :genre,  only: [:index, :show], param: :genre_id do
     resources :ebook, only: [:index, :show], param: :ebook_id
     end
  end
  post '202047446:AAHdxPmilyrI-hC3Qat0Igl0ZrncwpjYiFQ' => 'api/hook#webhook'
  # match "api" => proc { [404, {}, ['Invalid API endpoint']] }, via: [:get,:post]
  # match "api/*path" => proc { [404, {}, ['Invalid API endpoint']] }, via: [:get,:post]
  # match '/*path' => 'welcome#index', via:[:get,:post]
end

