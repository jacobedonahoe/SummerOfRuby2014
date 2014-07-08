require 'rack'
require_relative 'product'
require_relative 'handle_results'
require_relative 'product_catalog'
require_relative 'search_form'
require_relative 'browser'
require_relative 'form'
require_relative 'footer'
require_relative 'header'
class Application
  def self.run
    app = Rack::Builder.new do
      use Footer
      use Header
      map "/" do
        run SearchForm.new
      end
      map "/search" do
        run HandleResults.new
      end
      map "/browse" do
        run Browser.new
      end
    end
  end
end

