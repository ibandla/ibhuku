ActiveAdmin.register Ebook do
    permit_params :title, :author, :description, :price, :pdf, :category_id 
    
    
    index do
        selectable_column
        column :title
        column :author
        column :price
        column :category_id
        actions
    end
    
    filter :title
    filter :author
    filter :price
    filter :category
    
    form(:html => { :multipart => true }) do |f|
        f.inputs "Ebook" do
            f.input :title
            f.input :author
            f.input :category_id, :as => :select, :collection => Category.all.collect {|category| [category.name, category.id] }           
            f.input :description
            f.input :price
            f.input :pdf 
        end
        f.submit

    end

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



