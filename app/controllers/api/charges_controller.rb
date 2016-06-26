 class Api::ChargesController < Api::ApiController
 	
 	 respond_to :json 	

    def create

     	# render json: charge_params
     	@user = User.find(current_user.id)
     	@amount = charge_params[:totalCost]*100 
		charge = Stripe::Charge.create(
			:amount      => @amount,
			:description => current_user.fullname,
			:currency    => 'KES',
      :source => charge_params[:stripeToken]
		)

      # checks if the charge is paid and creates an order to #success 
        if charge["paid"]

            items = charge_params[:items]
            order =Order.create(user_id:current_user.id ,total:charge_params[:totalCost])
            items.each do |item|
              order.ebook_orders.create!(ebook_id:item[:id],price:item[:price])
            end  
            @user.cart_items.destroy_all
            render json:["Success"], status: 200
        end

        rescue Stripe::CardError => e
        render json:["Fail"], status: 500

 	end



        private
    def charge_params
      params.require(:data).permit(:tax,:stripeToken,:taxRate,:subTotal,:totalCost,:items=> [ :id,:title,:price,:author]).merge(user_id: current_user.id)
    end
end