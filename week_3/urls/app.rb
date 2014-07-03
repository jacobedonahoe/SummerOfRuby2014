require 'rack'

class HomeApp
  def call(env)
    content = %Q{
    <h1> Hello There</h1>
    <p>welcome to the home page.</p>
    }
    [200, {"content-type" => "text/html"}, [content]]
  end
end

class AboutApp
  def call(env)
    content = %Q{
    <h1>about us...</h1>
    <p>you've reached the about page!</p>
    }
  [200, {"content-type" => "text/html"}, [content]]
  end
end

app = Rack::Builder.new do

  map "/" do
    run HomeApp.new
  end
  
  map "/about" do
    run AboutApp.new
  end
end

server = Rack::Server.new :app => app, :server => "webrick"
server.start
