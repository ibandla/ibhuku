ActiveAdmin.register Ebook do
    permit_params :title, :author, :description, :price, :pdf, :category_id,:ebook_image,:ISBN


    index do
        selectable_column
        column :title
        column :author
        column :price
        column :category
        actions   
    end
    controller do
    def create
      super do |format|
        redirect_to admin_ebooks_url and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to admin_ebooks_url and return if resource.valid?
      end
    end
  end   
    show do
        attributes_table :title, :author,:description,:price,:pdf,:category_id,:ebook_image_cache
    end

    filter :title
    filter :author
    filter :price
    filter :category
    filter :ISBN

    form(:html => { :multipart => true }) do |f|
        f.inputs "Ebook" do
            f.input :title
            f.input :author
            f.input :category_id, as: :select, collection: Category.all   
            f.input :ISBN                 
            f.input :description
            f.input :price
            f.input :ebook_image, :as => :file, :hint => image_tag(f.object.ebook_image.url(:thumb))
            f.input :ebook_image_cache ,as: :hidden    
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
                                                                            