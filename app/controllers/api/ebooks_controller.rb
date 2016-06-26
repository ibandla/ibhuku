 class Api::EbooksController < Api::ApiController
 	
 	 respond_to :json 	 

      def index
       
        ebooks = Ebook.all
        render json: ebooks.select(:category_id, :ISBN, :title, :author, :description, :price, :id, :ebook_image)
      
     end
    	
     def show              
     	ebook = Ebook.select(:category_id, :ISBN, :title, :author, :description, :price, :id, :ebook_image).find(ebook_params[:ebook_id])
        ebook_image =  Hash[:url => ebook.ebook_image.url, :standard =>  Hash[:url => ebook.ebook_image.standard.url] ,:thumb => Hash[:url =>ebook.ebook_image.thumb.url]]
        compiled = ebook.attributes
        compiled[:ebook_image]= ebook_image
        compiled[:category]= Category.find(ebook['category_id'])
		render json:compiled, status: 200
	 end 

      private
    def ebook_params
      params.permit(:ebook_id)
    end
end