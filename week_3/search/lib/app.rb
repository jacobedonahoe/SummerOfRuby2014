require 'rack'
require_relative 'product.rb'
require_relative 'handle_results'
require_relative 'product_catalog'
require_relative 'search_form'
require_relative 'browser.rb'
require_relative 'form.rb'
class Application
  def self.run
    app = Rack::Builder.new do
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

