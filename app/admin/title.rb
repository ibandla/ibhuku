ActiveAdmin.register Title do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
before_filter :authorize

permit_params :name
index do
	column :name
	end
controller do
    def create
      super do |format|
        redirect_to admin_titles_url and return if resource.valid?
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
  attributes_table :name
end

form do |f|
  f.inputs  do
    f.input :name, as: :string 
  end
  f.actions
end


end
