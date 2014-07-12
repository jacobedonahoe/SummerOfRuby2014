require 'rack'
require_relative 'render_page'
require_relative 'handler'

class Page
  include RenderPage
  def call(env)
    render_page(env,env["REQUEST_PATH"])
  end
end

class Application
  def run
    app = Page.new
  end
end

