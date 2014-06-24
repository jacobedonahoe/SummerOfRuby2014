
require 'rack'

class HelloApp
  def call(env)
    content = env.inspect
    [200, {"Content-type" => "text/plain"}, [content]]
  end
end

app = HelloApp.new

server = Rack::Server.new :app => app, :server=> "webrick" 
server.star{
