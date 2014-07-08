class Header
  def initialize(app)
    @app = app
  end

  def call(env)
     status, headers, response = @app.call(env)

     headers["Content-type"] = "text/html"

     response_body = %Q{<h1><a href="browse">browse</a>}

     response_body << response.join("|n")

     headers["Content-length"] = response_body.length.to_s

     [status, headers, [response_body]]
  end
end
