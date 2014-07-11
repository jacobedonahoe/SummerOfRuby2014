class MyMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)

    #call original app and get its status, headers, and response
    status, headers, response = app.call(env)

    #d do things to the respose or headers
    
    #return the response
    
    [status, headers, response]
end
