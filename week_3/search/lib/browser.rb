require_relative 'form.rb'
class Browser
  include Form
  def call(env)
    content = search_form
    catalog = ProductCatalog.new
    products = catalog.find_all
    products.each  do |product|
      content << "<p> #{product.name}: #{product.price}</p>"
    end
    [200, {"Content-type" => "text/html"}, [content]]
  end
end
