require_relative 'form.rb'

class HandleResults
  include Form
  def call(env)
    content = search_form
    
    #get the data from the request
    request = Rack::Request.new(env)
    query = request.GET["query"]

    #find the products
    catalog = ProductCatalog.new
    products = catalog.find_all_by_keyword(query)

    #build the HTML for the response
    products.each do |product|
      content << "<p>#{product.name}: #{product.price}</p>"
    end

    #render that respose!
    [200, {"Content-type" => "text/html"}, [content]]
  end
end
