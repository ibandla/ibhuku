ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :blocked
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  # batch_action :banned do |ids|
  #   redirect_to collection_path, alert: "Selected Users were blocked"
  # end
actions :all
# , :except => [:new,:create,:destroy]
  
  form do |f|
    f.inputs "User" do
      f.input :blocked, as: :radio
      f.actions
    end
  end
  index do 
    column :fullname
    column :email
    bool_column :blocked
    actions  
  end
  
  show do
    attributes_table :fullname, :email,:blocked
  end
  
  
  
  filter :fullname
  filter :email
  filter :created_at
  
end