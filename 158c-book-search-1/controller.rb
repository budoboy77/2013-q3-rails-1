require '../dvc-sinatra.rb'

get "/" do
  halt erb(:browse)
end

get "/year/:year" do
  @year = params[:year]
  @books = Book.where(publication_year: @year).all  
  halt erb(:index)
end

# TODO: Write author route

get "/topic/:topic" do
	@topic = params[:topic]
	@books = Book.where("title ilike ?", "%#{@topic}%").all
	halt erb(:index)
end

