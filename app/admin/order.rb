ActiveAdmin.register Order do
    actions :all,:except => [:new, :create,:edit,:destroy]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:total, :user_id,items:charge_params[:items=> [ :_id,:_name,:_price,:_totalCost]]]
end
    index do
        column :id
        column :user_id
        number_column :total ,as: :currency,unit: "KES"
        column :created_at
        actions           
    end


    filter :id
    filter :total
    filter :user_id
    filter :created_at


    show do
        attributes_table do
            row :id
            row :user_id
            row :total
            list_row :items,list_type: :ol
        end
    end
    

end
