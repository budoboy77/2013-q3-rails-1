require '../dvc-sinatra.rb'

get "/" do
  redirect "/1"
end

get "/1" do
  @question_number = "1"
  @question_text = "What is 8 + 5?"
  @answer1 = "15"
  @answer2 = "40"
  @answer3 = "13"
  halt erb(:question1)
end

post "/1" do
  # TODO: Write this part
end

get "/2" do
  # TODO: Write this part
end

post "/2" do
  # TODO: Write this part
end

get "/done" do
  halt erb(:done)
end