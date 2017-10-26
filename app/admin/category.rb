ActiveAdmin.register Category do
#permited values in the category forms(Create,Update)
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
  
  #redirects to index view after create and update actions
  controller do
    def create
      super do |format|
        redirect_to admin_categories_url and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to admin_categories_url and return if resource.valid?
      end
    end
  end  
  
  #columns that appear in the show view 
  show do
  attributes_table :name, :description
  end

  form do |f|
    f.inputs  do
      f.input :name, as: :string
      f.input :description, as: :text
    end
    f.actions
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
