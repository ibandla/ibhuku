 class Api::GenreController < Api::ApiController
 	  
   

 	 respond_to :json 	 

      def index
       
        genres = Category.all
        render json: genres
      
     end
    	
    
     def show              
     	genre = Category.find(genre_params[:genre_id])
		render json:genre, status: 200
	 end 

      private
    def genre_params
      params.permit(:genre_id)
    end
end