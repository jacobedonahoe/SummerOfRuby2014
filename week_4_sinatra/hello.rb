require 'sinatra'

get "/" do
  "Hello World"
end

get "/about" do
  "This is the About page!"
end

get "/hello/:name" do
  name = params[:name]
  "hello there #{name}"
end
