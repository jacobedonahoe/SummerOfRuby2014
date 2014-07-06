
module Form
  def search_form
  content = %Q{
    <h2>Product search</h2>
    <form method="GET" action="/search">
      <label for="query">Search term</label>
      <input id="query type="text" name="query">
      <input type="submit" value="submit">
    </form>
  }
  end
end
