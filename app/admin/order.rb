ActiveAdmin.register Order do
  before_filter :authorize, :except => :index
  
    actions :all,:except => [:new, :create,:edit,:destroy]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:total,:user, :user_id,items:charge_params[:items=> [ :_id,:_name,:_price,:_totalCost]]]
end
    index do
        column :id
        column :user
        column :user_fullname
        number_column :total ,as: :currency,unit: "KES"
        column :created_at
        actions           
    end


    filter :id
    filter :total
    filter :user_email, :as => :string
    filter :user_fullname, :as => :string
    filter :created_at


    # show do
    #     attributes_table do
    #         row :id
    #         row :user_id
    #         row :total
    #         row 'ebooks' do |n|
    #             row 's' order.ebooks.pluck(:title,:ISBN).join("<br />").html_safe
    #       end
    #         # list_row :ebooks,list_type: :ol
    #     end
    # end

     show do
    panel "Order Details" do
      table_for order.ebooks do
        column :id
        column :title
        column :ISBN
        column :category
        column :price
        # ...
      end
    end
  end
  sidebar "Order Information", only: [:show] do
    attributes_table_for order do
      row :id
      row :user_id
      row :total
    end
  end
    

end
