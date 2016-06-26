 class Api::EbooksController < Api::ApiController
 	
 	 respond_to :json 	 
     

      def index
       
         ebooks = Ebook.all
        render json: ebooks.select(:category_id, :ISBN, :title, :author, :description, :price, :id, :ebook_image)
      
      
     end

     def pdfdata
         ebooks = Ebook.all
         result =  [{text: 'Title', style: 'header'}, {text: 'Author', style: 'header'}, {text: 'Category', style: 'header'},
                {text: 'ISBN', style: 'header'},{text: 'Price', style: 'header'}]
         ebooks.each  do |e|
             result << [{"text": e.title},{"text": e.author},{"text": e.category.name},{"text": e.ISBN},{"text": e.price}]
         end
      
        render json: result
     end
    

     def show
        @client = Goodreads.new()              
     	ebook = Ebook.select(:category_id, :ISBN, :title, :author, :description, :price, :id, :ebook_image).find(ebook_params[:ebook_id])
        ebook_image =  Hash[:url => ebook.ebook_image.url, :standard =>  Hash[:url => ebook.ebook_image.standard.url] ,:thumb => Hash[:url =>ebook.ebook_image.thumb.url]]
        compiled = ebook.attributes
        compiled[:ebook_image]= ebook_image
        compiled[:category]= Category.find(ebook[:category_id])
        compiled[:goodreads] = @client.book_by_isbn(ebook[:ISBN])
		render json:compiled, status: 200
	 end 

      private
    def ebook_params
      params.permit(:ebook_id)
    end
end