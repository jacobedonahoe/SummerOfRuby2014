module Handler
  def call(env)
    request = Rack::Request.new(env)
    if request.post?
      if request.GET["name"]
        name = request.GET["name"]
      else
        name = "you didn't enter a name!"
      end

      if request.GET["email_address"]
        email_address = request.GET["email_address"]
      else
        email_address = "you didn't enter an email address"
      end

      if request.GET["comments"]
        comments = request.GET["comments"]
      else
        comments = "you didn't enter any comments"
      end
      content = %Q{
      name: #{name}\n\nemail: #{email_address}\n\nmessage: #{comments}}
      [200, {"Content-type" => "text/html"}, [content]]
    end
  end
end
