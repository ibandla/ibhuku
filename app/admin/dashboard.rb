ActiveAdmin.register_page "Dashboard" do
 
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span("Welcome!")
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
  #  index do
      
      
# columns do
#       column do
#         panel "Users" do
#           ol do
#             Users.all.map do |user|
#               li (user.name)
#               li (user.email)
#               li (user.created_at)
#             end
#           end
#         end
#       end

     #  columns do
     #    panel "Users" do
     #      table_for User.all.map do
     #        column :name
     #        column :email
     #        column :created_at
     #    end
     #  end
     # end
  
  # content
  
  end
end
