class WelcomeController < ApplicationController
   layout 'frontend'
  def index
  end
  	
  def redirect
  	redirect("/?goto=%{path}")
  end
end
