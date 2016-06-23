 class Api::ChargesController < Api::ApiController
 	
 	 respond_to :json 	

    # def new

	# 	@user = current_user
	# 	@amount = charge_params[:totalCost]

	# end

    def create

     	render json: charge_params
     	# @user = current_user
     	# @amount = charge_params[:totalCost]

		# # create customer with user details for strip
		# customer = Stripe::Customer.create(
		# 	:email => @user.email,
		# 	:source  => params[:stripeToken]
		# )
		# # creates a charge with customer details and and  
		# charge = Stripe::Charge.create(
		# 	:customer    => customer.id,
		# 	:amount      => @amount,
		# 	:description => 'Rails Stripe customer',
		# 	:currency    => 'kes'
		# )

      # this changes the status of the current cart to success 
    if charge["paid"]

        @cart_item.update_status(current_cartitem)
        session[:cart_item_id] = nil
        @order.ebook_order.create!(user_id:current_user.id ,total:charge_params[:totalCost,:items])
		flash[:notice] = "An Order has been placed"
        redirect_to current_user, notice: 'You placed an order!'	  
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
	# flash[:error] = "did not charge"

 	end

        private
    def charge_params
      params.require(:data).permit(:tax,:stripeToken,:taxRate,:subTotal,:totalCost,:items=> [ :id,:name,:price,:total]).merge(user_id: current_user.id)
    end
end