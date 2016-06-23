 class Api::ChargesController < Api::ApiController
 	
 	 respond_to :json 	

    def create

     	# render json: charge_params
     	@user = current_user
     	@amount = charge_params[:totalCost]*100 
		charge = Stripe::Charge.create(
			:amount      => @amount,
			:description => 'Rails Stripe customer',
			:currency    => 'KES',
            :source => charge_params[:stripeToken]

		)

      # checks if the charge is paid and creates an order to #success 
        if charge["paid"]
            Order.create!(user_id:current_user.id ,total:charge_params[:totalCost],ebook_orders:charge_params[:items])
            render json:["Succes"], status: 200
        end

        rescue Stripe::CardError => e
        flash[:error] = e.message

 	end



        private
    def charge_params
      params.require(:data).permit(:tax,:stripeToken,:taxRate,:subTotal,:totalCost,:items=> [ :_id,:_name,:_price,:_totalCost]).merge(user_id: current_user.id)
    end
end