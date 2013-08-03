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
  halt erb(:question)
end

post "/1" do
  if params[:answer] == "3"
  	redirect "/2"
  else
  	redirect "/1"
  end
end

get "/2" do
  @question_number = "2"
  @question_text = "What is 5 - 3?"
  @answer1 = "2"
  @answer2 = "3"
  @answer3 = "8"
  halt erb(:question)
end

post "/2" do
  if params[:answer] == "1"
  	redirect "/done"
  else
  	redirect "/2"
  end
end

get "/done" do
  halt erb(:done)
end