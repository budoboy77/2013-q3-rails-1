require '../dvc-sinatra.rb'

get "/" do
  @guesses = Guess.all
  @rows = [1, 2, 3, 4, 5]
  @cols = ["A", "B", "C", "D", "E"]
  halt erb(:grid)
end

post "/" do
  @guesses = Guess.all
  @rows = [1, 2, 3, 4, 5]
  @cols = ["A", "B", "C", "D", "E"]

  row = params[:row]
  col = params[:col]
  current_guess = Guess.where(row: row, col: col).first
	  if current_guess != nil
	  	@error = "You guessed that already."
	  	halt erb(:grid)
	  else
	  guess = Guess.new
	  guess.row = params[:row]
	  guess.col = params[:col]

	  ship = Ship.where(row: row, col: col).first
		  if ship != nil
		  	guess.was_hit =  true
		  else
		  	guess.was_hit = false
		  end
	  guess.save!

	  redirect "/"
	end
end