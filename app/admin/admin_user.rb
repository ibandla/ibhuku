ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
  column :email 
  column :current_sign_in_at
  column :sign_in_count
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
    end
    f.actions
  end

end
