ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :banned
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  batch_action :banned do |ids|
    User.find(ids).each do |user|
      user.banned! :banned 
    end
    redirect_to collection_path, alert: "user(s) have been blocked."
  end
  actions :all, :except => [:new,:create,:destroy]
  action_item :banned, only: :index do
      link_to 'Block', root_path
      end


  index do 
  selectable_column
    column :name
    column :email
    actions
    
      
  end
  
  show do
  attributes_table :name, :email,:banned
  end
  
  filter :name
  filter :email
  filter :created_at
  
end
