require 'rack'

module BrowserDetection(browser_type)
  if env.include?("Chrome")
    content = "<h1>Hello there</h1>"
  else
    content = "I don't recognize your browser"
  end
end
include BrowserDetection
class HelloApp
  def call(env)
    self.browser_detection(env)
    [200, {"Content-type" => "text/plain"}, [content]]
  end
end

app = HelloApp.new

server = Rack::Server.new :app => app, :server=> "webrick" 
server.start
