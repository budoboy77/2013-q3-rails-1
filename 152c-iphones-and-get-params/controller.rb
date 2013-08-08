require '../dvc-sinatra.rb'

get "/" do
  halt erb(:grid)
end

get "/listings" do
  model = params[:model]
  gigs = params[:gigs]

	if gigs != nil
		if model != nil
  			@listings = Listing.where(gigs: gigs).where(model: model).order("price desc")
  		else
  			@listings =  Listing.where(gigs: gigs).order("price desc")
  		end
  	elsif
  		if model != nil
  			@listings = Listing.where(model: model).order("price desc")
  		end
  	else
  		@listings =  Listing.order("price desc").all
  	end
  # else
  #	@listings = Listing.all
 # end

  # if model != nil
  # 	@listings =  Listing.where(model: model)
  # else
  # 	@listings = Listing.all
  # end

  halt erb(:listings)
end
