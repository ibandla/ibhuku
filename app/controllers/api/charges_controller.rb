 class Api::ChargesController < Api::ApiController
 	
 	 respond_to :json 	 
    def
     def create
     	render json: charge_params
     	@amount = charge_params[:totalCost]

  	customer = Stripe::Customer.create(
    	:email => @user.email,
    	:card  => params[:stripeToken]
  	)

  	charge = Stripe::Charge.create(
    	:customer    => @user.id,
    	:amount      => @amount,
    	:description => 'Rails Stripe customer',
    	:currency    => 'kes'
 	 )

      # this changes the status of the current cart to success 
  	@cart_item.update_status(current_cartitem)
  	session[:cart_item_id] = nil
  	redirect_to current_user, notice: 'You placed an order!'
  	if  charge["paid"]
  		Order.create(charge_params)
  		if @order.save
  		
  	end
  end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end    
     end

        private
    def charge_params
      params.require(:data).permit(:tax,:taxRate,:subTotal,:totalCost,:items=> [ :id,:name,:price,:total]).merge(user_id: current_user.id)
    end
end