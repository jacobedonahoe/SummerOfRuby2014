require_relative 'handler'
module RenderPage
  def handle(env)
    request = Rack::Request.new(env)
    if request.post?
      name = request.GET["name"]
      name = name == "" ? "you didn't enter a name" : request.GET["name"]

      email = request.GET["email_address"]
      email = email == "" ? "you didn't enter an email address" : request.GET["name"]

      comments = request.GET["comments"]
      comments = comments == "" ? "you didn't enter any comments!" : request.GET["name"]

      content = %Q{
        <!DOCTYPE html>
        <html lang="en-US">
          <head>
            <meta charset="utf-8">
            <title>submit contact</title>
          </head>
          <body>
            <h1>your entry</h1>
            <p>name: #{name}</p>
            <p>email: #{email}</p>
            <p>message: #{comments}</p>
          </body>
        </html>
      }
      [200, {"Content-type" => "text/html"}, [content]]
    end
  end

  def render_page(env,page_name)
    if page_name == "/submit_contact"
      self.handle(env)
    else
      page_name = page_name == "/" ? "home_page" : page_name

      content = File.read("./lib/html#{page_name}.html")

      [200, {"content-type" => "text/html"}, [content]]
    end
  end
end
