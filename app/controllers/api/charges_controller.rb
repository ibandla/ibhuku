 class Api::ChargesController < Api::ApiController
 	
 	 respond_to :json 	

    def create

     	# render json: charge_params
     	@user = current_user
     	@amount = charge_params[:totalCost]*100 
		charge = Stripe::Charge.create(
			:amount      => @amount,
			:description => current_user.fullname,
			:currency    => 'KES',
      :source => charge_params[:stripeToken]
		)

      # checks if the charge is paid and creates an order to #success 
        if charge["paid"]
            @user = current_user.email

            @order =Order.new(user_id:current_user.id ,total:charge_params[:totalCost],items:charge_params[:items])
            @order.save
            @order.ebook_orders.create!(price:charge_params[:totalCost],items:charge_params[:items])

            @items = charge_params[:items]
            @items.each do |item|
            	url = Ebook.find(item["0"]).pdf.url
            	# UserMailer.welcome_email(@user,url).deliver_now
            
            end
           

            render json:["Succes"], status: 200
        end

        rescue Stripe::CardError => e
        flash[:error] = e.message

 	end



        private
    def charge_params
      params.require(:data).permit(:tax,:stripeToken,:taxRate,:subTotal,:totalCost,:items=> [ :id,:title,:price,:author]).merge(user_id: current_user.id)
    end
end