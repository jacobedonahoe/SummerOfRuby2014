require 'rack'
require_relative 'render_page'

class Application
  def self.run
    app = Rack::Builder.new do
      map "/" do
        run HomePage.new
      end
      map "/about_me"
        run AboutMePage.new
      end
      map "/resume"
        run ResumePage.new
      end
      map "/contact"
        run ContactPage.new
      end
      map "/submit_contact"
        run SubmitContactPage.new
      end
    end
  end
end

