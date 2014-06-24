require 'rack'

class HelloApp
  def call(env)
    content = "hello from Rack"
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

app = HelloApp.new

app = lambda do |env|
  content = "Hello from Rack"
  [200, {"Content-type" => "text/html"}, [content] ]
end

server = Rack::Server.new :app => app, :server=> "webrick" 
server.start
