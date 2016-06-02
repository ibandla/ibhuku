 class Api::TitlesController < Api::ApiController
 	
 	 respond_to :json 	 
    	
     def index
        @titles = Title.select("id, name")
     	respond_with(@titles)
     end

end