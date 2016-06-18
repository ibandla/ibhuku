Rails.application.routes.draw do

  get 'charges/new'
  get 'charges/create'
  root 'welcome#index'
  mount_devise_token_auth_for 'User', at: 'api/auth', controllers: { registrations: "user/registrations",passwords:"user/passwords", sessions:"user/sessions" , confirmations:"user/confirmations",token_validations:"user/token_validations"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: {format: :json} do
     resources :cart, only: [:index, :create, :destroy], param: :ebook_id
     resources :ebooks, only: [:index, :show], param: :ebook_id
     resources :token, only: [:index]
     resources :titles, only: [:index]
     resources :charges, only: [:create,:new], param: :data
  end
  post '202047446:AAHdxPmilyrI-hC3Qat0Igl0ZrncwpjYiFQ' => 'api/hook#webhook'

end
