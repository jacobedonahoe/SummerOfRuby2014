require 'rack'

module Render
  def render_page(step_name)
    content = File.read("html/#{step_name}.html")
    [200, {"content-type" => "text/html"}, [content]]
  end
end

include Render

app = Rack::Builder.new do
  map "/" do
    run lambda{ |env|
    step_name = "step_one"
    self.render_page(step_name)
    }
  end
  map "/step_two.html" do
    run lambda{ |env|
    step_name = "step_two"
    self.render_page(step_name)
    }
  end
  map "/step_three.html" do
    run lambda{ |env|
    step_name = "step_three"
    self.render_page(step_name)
    }
  end
end

Rack::Server.new(:app => app, :server => "webrick").start
