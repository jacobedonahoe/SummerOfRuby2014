require 'rack'
class BrowserDetector
  def initialize(agent)
    @agent = agent
  end
  def is_firefox?
    @agent.include?("Firefox")
   end

  def is_ie?
    @agent.include?("MSIE") && @agent.include?("Trident")
  end
  
  def is_chrome?
    @agent.include?("Chrome/")
  end
end

class BrowserDetect
  def initialize
    @content = ""
  end

  def call(env)
    create_content BrowserDetector.new(env["HTTP_USER_AGENT"])
    render_response
  end
  
  private
    def create_content(browser)
    @content = if browser.is_firefox?
              "It's Firefox"
            elsif browser.is_ie?
              "why are you using IE?"
            elsif browser.is_chrome?
              "Hi, Chrome User!"
            else
              "I don't recognize your browser."
            end
  end
  
  def render_response
    [200, {"content-type" => "text/plain"}, [@content]]
  end

end

app = BrowserDetect.new


Rack::Server.new (:app => app, :server=> "webrick" ).start
