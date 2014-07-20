require 'sinatra'

get "/" do
  @title = "home"
  @message = "Hello World"
  erb :index
end

get "/name/:name" do
  @name = params[:name]
  @title = "name"
  @message = "Hello there #{@name}!"
  erb :index
end

get "/links" do
  @links = [
    {:text => "Google", :href => "http://google.com"},
    {:text => "Woot", :href => "http://woot.com"},
    {:text => "Biblegateway", :href => "http://biblegateway.com"}
  ]
  erb :links
end

__END__

@@ links
<%if @links.length > 0 %>
  <ol>
    <% @links.each do |link| %>
      <li><a href="<%= link[:href] %>"><%= link[:text] %></a></li>
    <% end %>
  </ol>
<% else %>
  <p>There are no links to display.</p>
<% end %>

@@ index
<h1><%= @message %></h1>
<p><%= Date.today %></p>

@@ layout
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <title><%= @title%></title>
  </head>
  <body>
    <header>
      <h1><%= @title %></h1>
    </header>

    <section class="main">
      <%= yield %>
    </section>

    <footer>
      Copyright <%= Date.today.year %> Jacob Donahoe
    </footer>
  </body>
</html>
