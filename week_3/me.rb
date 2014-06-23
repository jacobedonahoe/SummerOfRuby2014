require 'rack'

class App
  def call(env)
    content = %Q{
    <!DOCTYPE HTML>
    <html lang=en-US>
      <head>
        <meta charset=utf-8>
        <title>Jacob</title>
      </head>
      <body>
        <h1>Jacob Donahoe</h1>
        <blockquote>
          "the way to eat an elephant is one bite at a time"
        </blockquote>
      </body>

    </html>
    }
  [200, {"Content-type" => "text/html"}, [content]]
  end
end

app = App.new

server = Rack::Server.new :app => app, :server => "webrick"
server.start
