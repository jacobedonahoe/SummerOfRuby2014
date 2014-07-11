require 'rack'
require_relative 'render_page'
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
      map "/about_me"
        run lambda{|env|
        page_name ="about_me"
        self.render_page(page_name)
        }
      end
      map "/resume"
        run lambda{|env|
        page_name="resume"
        self.render_page(page_name)
        }
      end
      map "/contact"
        run lambda{|env|
        page_name="contact"
        self.render_page(page_name)
        }
      end
      map "/submit_contact"
        run Handler.new
      end
    end
  end
end

