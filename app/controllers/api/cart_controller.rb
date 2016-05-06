 class Api::CartController < ApplicationController
 	 skip_before_filter :verify_authenticity_token
 	 before_action :authenticate_user!
 	 respond_to :json 	 
    	
     def show
     	respond_with(CartItem.where(user_id: params[:id]).group_by(&:ebook_id))
     end

     def create
        @ebook_id = params[:cart]['ebook_id']
        @user_id = params[:cart]['user_id'] 
       
     	@cart_item = CartItem.new(id: [@user_id,@ebook_id])
			@cart_item.save	
			render json: @cart_item.to_json, status: 200
		 end    

     def destroy
     	if !params[:ebook_id]
     		CartItem.where(user_id: params[:id]).destroy_all     		
     	else
     		CartItem.find([params[:id],params[:ebook_id]]).destroy
     	end
     	render json: "Success", status: 200
     end


   end