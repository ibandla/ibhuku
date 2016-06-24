 class Api::EbooksController < Api::ApiController
 	  
     include CleanPagination

 	 respond_to :json 	 

      def index
       
        ebooks = Ebook.all
        render json: ebooks.select('category_id','ISBN','title','author','description','price','id','ebook_image')
      
     end
    	
     # def index
     #    @ebooks = Ebook.all
     # 	respond_with(@ebooks)
     # end

     def show              
     	@ebook = Ebook.find(ebook_params[:ebook_id])
        category = Category.find(@ebook['category_id'])
        @ebook.attributes = ({ :category_id => category.name})
        
        # @ebook = ebook.merge(Category.find(ebook['category_id']))
		render json:@ebook, status: 200
	 end 

      private
    def ebook_params
      params.permit(:ebook_id)
    end
end