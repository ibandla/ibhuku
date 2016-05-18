 class Api::EbooksController < Api::ApiController
 	  
     include CleanPagination

 	 respond_to :json 	 

      def index
        max_per_page = 8

        paginate Ebook.count, max_per_page do |limit, offset|
        render json: Ebook.limit(limit).offset(offset)
      end
     end
    	
     # def index
     #    @ebooks = Ebook.all
     # 	respond_with(@ebooks)
     # end

     def show              
     	@ebook = Ebook.find(ebook_params[:ebook_id])
		render json:@ebook, status: 200
	 end 

      private
    def ebook_params
      params.permit(:ebook_id)
    end
end