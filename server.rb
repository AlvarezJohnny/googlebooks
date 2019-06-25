require "sinatra"
require "googlebooks"

get "/" do
  erb :home
end

get "/results" do
  @books = GoogleBooks.search("#{params[:search]}").first.title
  @author = GoogleBooks.search("#{params[:search]}").first.authors
  @photo = GoogleBooks.search("#{params[:search]}").first.image_link(:curl => true)
  @info = GoogleBooks.search("#{params[:search]}").first.info_link
  erb :results
end
