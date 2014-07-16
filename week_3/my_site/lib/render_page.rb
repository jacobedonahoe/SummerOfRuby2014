require_relative 'handler'
module RenderPage
  def handle(env)
    request = Rack::Request.new(env)
    if request.post?
      name = request.POST["name"]
      name = "Please enter a default name" if name == "" || name.nil?

      email = request.POST["email_address"]
      email = "Please enter an email address" if name == "" || name.nil?

      comments = request.POST["comments"]
      comments = "Please enter some comments" if comments = "" || name.nil?

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

  def render_page(env)
    page_name = env["REQUEST_PATH"]
    if page_name == "/submit_contact"
      self.handle(env)
    else
      page_name = page_name == "/" ? "home_page" : page_name

      content = File.read("./lib/html/#{page_name}.html")

      [200, {"content-type" => "text/html"}, [content]]
    end
  end
end
