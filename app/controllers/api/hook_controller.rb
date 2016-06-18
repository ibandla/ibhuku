class Api::HookController < ActionController::Base
  skip_before_filter :verify_authenticity_token
  # include TeleNotify::Controller


  def webhook
        if params[:message]
            text = params[:message][:text]
            id = params[:message][:from][:id]

            if TeleNotify::TelegramUser.find_by(telegram_id: id)
              user = TeleNotify::TelegramUser.find_by(telegram_id: id)
              username = user.username
              if !(defined?(username)).nil?
                user.username = text
                user.save

                db_user = User.find_by(email: text)
                user.send_message("Welcome " + db_user.fullname)
              else
                user.send_message("Already registered")
              end
            else
              user = TeleNotify::TelegramUser.create( { telegram_id: id,
                                          first_name: params[:message][:from][:first_name],
                                          username: params[:message][:from][:username]})
                user.send_message("Please enter your email to verify")
            end
           render :nothing => true, :status => :ok
          end
   end

end
