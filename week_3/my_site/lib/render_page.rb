module RenderPage
  def render_page(page_name)
    content = File.read("html/#{page_name}.html")
    [200, {"content-type" => "text/html"}, [content]]
  end
end
