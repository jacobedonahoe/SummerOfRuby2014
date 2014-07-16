require 'sinatra'
require 'sqlite3'

#assigning constant to refer to store database
CONNECTION = SQLite3::Database.new("store.sqlite3")

CONNECTION.execute <<-SQL
  CREATE TABLE IF NOT EXISTS "items" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" VARCHAR,
    "price" DOUBLE DEFAULT 0
  )
SQL

get "/items" do
  results = CONNECTION.execute("select name,price from items order by ROWID desc limit 20")
  tablerows= results.collect do |row|
    "<tr><td>#{row[0]}</td><td>#{row[1]}</td></tr>"
  end

  %Q{
    <h1>Items</h1>
    <fieldset>
      <legend>Add item</legend>
      <form action="/items" method="POST">
        <label>Name: <input type="text" name="name"></label>
        <label>Price: <input type="number" name="price"></label>
        <input type="submit" name="Add">
      </form>
    </fieldset>

    <table>
      <tr>
        <th>Name</th>
        <th>Price</th>
      </tr>
      #{tablerows.join}
    </table>
  }
end

get "/items/:id" do
  id = params[:id]
  result = CONNECTION.execute("select id,name,price from items where id=(?)", id)
  item = result[0]
  output = "<tr><td>#{item[0]}</td><td>#{item[1]}</td><td>#{item[2]}</td></tr>"
  %Q{
    <h1>The item you have requested..</h1>
    <table>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
      </tr>
      #{output}
    </table>
  }
end

post "/items" do
  name = params[:name]
  price = params[:price]

  CONNECTION.execute("INSERT INTO items
                     (name, price) VALUES (?,?)", [name, price])

  redirect "/items"
end
