 class Api::PurchasesController < Api::ApiController
 	 skip_before_filter :verify_authenticity_token
 	 # before_action :authenticate_user!
 	 respond_to :json 	 
    	
     def index
        user = User.find(2).ebooks
        @items = user
        render json:@items, status: 200     	
     end

     def show
        user = User.find(id: current_user.id)
        @items = User.ebooks.find_by(id: purchase_params[:ebook_id])
        render json:@items, status: 200    
     end
   
      private
    def purchase_params
      params.permit(:ebook_id)
    end
end