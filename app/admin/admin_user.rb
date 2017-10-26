ActiveAdmin.register AdminUser do
  before_filter :authorize, except: [:index,:show]
  
  permit_params :email, :password, :password_confirmation

  index do
  column :email
  column :current_sign_in_at
  column :sign_in_count
  column :created_at
  column :role
  
  end


  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
    end
    f.actions
  end

end
