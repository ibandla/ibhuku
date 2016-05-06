 class Api::EbooksController < Api::ApiController
 	
 	 respond_to :json 	 
    	
     def index
        @ebooks = Ebook.all
     	respond_with(@ebooks)
     end

     def show              
     	@ebook = Ebook.find(ebook_params[:ebook_id])
		render json:@ebook, status: 200
	 end 

      private
    def ebook_params
      params.permit(:ebook_id)
    end
end