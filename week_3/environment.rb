require 'rack'



class HelloApp
  def call(env)
if env.include?("HTTP_USER_AGENT")
  content = "<h1>Hello there</h1>"
else
  content = "I don't recognize your browser"
end
    [200, {"Content-type" => "text/plain"}, [content]]
  end
end

app = HelloApp.new

server = Rack::Server.new :app => app, :server=> "webrick" 
server.start
