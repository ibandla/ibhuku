ActiveAdmin.register Ebook do
    permit_params :title, :author, :description, :price, :pdf, :category_id,:ebook_image,:remote_ebook_image_url


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
            f.input :category_id, as: :select, collection: Category.all        
            f.input :description
            f.input :price
            f.input :ebook_image, :as => :file, :hint => image_tag(f.object.ebook_image.url(:thumb))
            f.input :ebook_image_cache ,as: :hidden    
            # f.input :remote_ebook_image_url, "or image URL:"          
            f.input :pdf
            f.input :pdf_cache ,as: :hidden    

        end
        f.actions
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
                                                                            