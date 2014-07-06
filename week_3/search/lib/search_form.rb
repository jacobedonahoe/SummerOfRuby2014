require_relative 'form.rb'
class SearchForm
  include Form
  def call(env)
    content = search_form
    [200, {"Content-type" => "text/html"}, [content]]
  end
end
