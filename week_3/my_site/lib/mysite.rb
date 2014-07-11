require 'rack'
require_relative 'render_page'
require_relative 'handler'
class Application
include RenderPage
  def self.run
    app = Rack::Builder.new do
      map "/" do
        run lambda{|env|
        page_name = "home_page"
        self.render_page(page_name)
        }
      end
      map "/about_me" do
        run lambda{|env|
        page_name ="about_me"
        self.render_page(page_name)
        }
      end
      map "/resume" do
        run lambda{|env|
        page_name="resume"
        self.render_page(page_name)
        }
      end
      map "/contact" do
        run lambda{|env|
        page_name="contact"
        self.render_page(page_name)
        }
      end
      map "/submit_contact" do
        run Handler.new
      end
    end
  end
end

