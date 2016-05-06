 class Api::EbooksController < Api::ApiController
 	 # skip_before_filter :verify_authenticity_token
 	 # before_action :authenticate_user!
 	 respond_to :json 	 
    	
     def index
        @ebooks = Ebook.all        
        
     	respond_with(@ebooks)
     end

     def create              
     	@cart_item = CartItem.new(cart_params)
			@cart_item.save	
			render json:@cart_item, status: 200
		 end   

    # def update       
    #     CartItem.find([cart_params[:ebook_id],cart_params[:user_id]]).destroy
    #     render json: "Success", status: 200
    # end


     def destroy
        if params[:ebook_id] === "all"
            CartItem.where(user_id: cart_params[:id]).destroy_all            
        else
            CartItem.find([cart_params[:ebook_id],cart_params[:user_id]]).destroy
        end
        render json:@cart_params, status: 200
     end

      private
    def cart_params
      params.permit(:ebook_id).merge(user_id: current_user.id)
    end
end