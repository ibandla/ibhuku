ActiveAdmin.register Order do
    actions :all
    # , :except => [:new, :create]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:total, :user_id]
  
end
 form(:html => { :multipart => true }) do |f|
        f.inputs "Order" do
            f.input :user, as: :select ,collection: User.all
            f.input :total ,:value => number_to_currency(:total, unit: :kes ,precision: 3)
            # ,:  hint => cl_image_tag(f.object.pdf.url, :format => :png,:width => 200, :height => 250,:crop => :fill, :page => 1)
            # f.input :pdf_cache ,as: :hidden    
        end
        f.actions
    end


end
