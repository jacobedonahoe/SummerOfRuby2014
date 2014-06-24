
require 'rack'

class App
  def call(env)
    content = File.read("index.html")
  [200, {"Content-type" => "text/html"}, [content]]
  end
end

app = App.new

server = Rack::Server.new :app => app, :server => "webrick"
server.start
