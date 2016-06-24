 class Api::EbookController < Api::ApiController
 	 # skip_before_filter :verify_authenticity_token
 	 # before_action :authenticate_user!
 	 respond_to :json 	 
    	
     def index
        ebooks = Ebook.where(category_id: genre_params[:genre_genre_id]).all       
        
     	respond_with(ebooks)
     end

    
     def show
         ebook = Ebook.find_by(category_id: genre_params[:genre_genre_id],id:ebook_params[:ebook_id])     
        respond_with(ebook)
     end

      private

      def genre_params
          params.permit(:genre_genre_id)
     end

      def ebook_params
          params.permit(:ebook_id)
     end
 
end