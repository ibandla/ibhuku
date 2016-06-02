class Throttle 
  def initialize(app)
    @app = app 
  end 
 
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["My Middleware"]]
  end 
end