ActiveAdmin.register Category do
    permit_params :name, :description

    #filter options
    filter :name

    #columns displayed on Categories page
    index do
    selectable_column
    column :name
    column :description
    actions
  end
  show do
  attributes_table :name, :description
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
