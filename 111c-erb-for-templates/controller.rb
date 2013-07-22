require '../dvc-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/reposts/1" do
	@heading = "Spring cleanup for object creation in Ruby"
	@summary = "A complex object creation can clutter a controller. It’s better to move it into a dedicated method of the corresponding model."
	@link = "http://blog.8thcolor.com/2013/07/spring-cleanup-for-object-creation-in-rails/"
  halt erb(:repost1)
end

get "/reposts/2" do
  halt erb(:repost2)
end
