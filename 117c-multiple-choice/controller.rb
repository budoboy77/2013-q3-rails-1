require '../dvc-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/example1" do
	@title = "blank"
  halt erb(:onefile)
end

get "/example2" do
	@title = "example2"
  halt erb(:onefile)
end

get "/example3" do
	@title = "example3"
  halt erb(:onefile)
end