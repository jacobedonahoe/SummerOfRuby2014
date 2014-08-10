require 'sinatra/base'
require 'sqlite3'
class MyApp < Sinatra::Base

  #assinging constant to refer to links database
  CONNECTION = SQLite3::Database.new("links.sqlite3")

  CONNECTION.execute <<-SQL
    CREATE TABLE IF NOT EXISTS "links" (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT,
      "name" VARCHAR,
      "url" VARCHAR,
      "description" VARCHAR
    )
  SQL

  get "/" do
    results = CONNECTION.execute("select id,name,url,description from links order by ROWID desc limit 10")
    @tablerows= results.collect do |row|
      %Q{
        <tr><td>#{row[1]}</td><td><a href="localhost:9292/links/#{row[0]}</a>#{row[2]}</td><td>#{row[3]}</td></tr>
      }
    end
    erb :links
  end

  get "/links" do
    results = CONNECTION.execute("select id,name,url,description from links order by ROWID desc")
    @tablerows= results.collect do |row|
      %Q{
        <tr><td>#{row[1]}</td><td><a href="localhost:9292/links/#{row[0]}">#{row[2]}</a></td><td>#{row[3]}</td></tr>
      }
    end
    erb :links
  end

  post "/links" do 
    id = params[:id]
    name = params[:name]
    url = params[:url]
    description = params[:description]

    CONNECTION.execute(
                       "INSERT INTO links
                       (name, url, description) VALUES (?,?,?)", 
                       [name, url, description]
                       )
    redirect "/links"
  end

  get "/links/:id" do
    id = params[:id]
    result = CONNECTION.execute("select id, name, url, description from links where id=(?)", id)
    link = result[0]
    @output = %Q{
    <tr><td>#{link[1]}</td><td><a href="#{link[2]}">#{link[2]}</a></td><td>#{link[3]}</td></tr>
    }
    erb :id
  end

end

  
