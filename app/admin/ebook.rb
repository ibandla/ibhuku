ActiveAdmin.register Ebook do
    permit_params :title, :author, :description, :price, :pdf, :category_id,:ebook_image,:ISBN

    
    csv do
      column :title
      column :ISBN
      column :author
      column :price
    end    
    index do
        selectable_column
        column :title
        column :author
        number_column :price ,as: :currency,unit: "KES"
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
        attributes_table do
        row :title
        row :author
        row :description
        row :price
        row :category
        number_row :price, as: :currency,unit: "KES"
end
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
            f.input :pdf ,:as => :file
            # ,:  hint => cl_image_tag(f.object.pdf.url, :format => :png,:width => 200, :height => 250,:crop => :fill, :page => 1)
            # f.input :pdf_cache ,as: :hidden    
        end
        f.actions
    end
   index :as => :grid,columns: 10 do |ebook|
    div do
      a :href => admin_ebook_path(ebook) do
        image_tag(ebook.ebook_image.url(:thumb),:width => 125, :height => 150)
      end
    end
    a truncate(ebook.title), :href => admin_ebook_path(ebook)
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
                                                                            