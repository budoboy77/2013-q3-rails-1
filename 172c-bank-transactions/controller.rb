require '../dvc-sinatra.rb'

get "/"  do
  redirect "/login"
end

get "/login"  do
  halt erb(:login)
end

post "/login" do
  found_user = User.where(username: params[:username]).first

  if found_user && params[:password] == found_user.password
    session[:user_id] = found_user.id
    redirect "/accounts"
  else
    @error = "Incorrect username or password"
    halt erb(:login)
  end
end

get "/accounts" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:accounts)
end

get "/location" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:location)
end

get "/rates" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:rates)
end

get "/logout" do
  session.clear
  redirect "/login"
end

get "/accounts/:page" do
  @user = User.where(id: session[:user_id]).first
  @account = @user.accounts.where(account_type: params[:page]).first
  halt erb(:transactions)
end

post "/accounts/:page" do
  @user = User.where(id: session[:user_id]).first
  @account = @user.accounts.where(account_type: params[:page]).first

  if params[:date && :memo && :amount] != ""
  #if params[:commit] == "Save" && params[:date] != ""
    transaction = @account.transactions.new
    transaction.date = params[:date]
    transaction.memo = params[:memo]
    transaction.amount = params[:amount]
    transaction.save!
    @account.current_balance = @account.current_balance + transaction.amount
    @account.save!
    redirect "/accounts/#{params[:page]}"
  end

  @account.transactions.each do |transaction|
    if params["memo#{transaction.id}"] == "memo#{transaction.id}"
      transaction.memo = params["memo#{transaction.id}"]
      transaction.save!
    end
    if params[:commit] == "Delete transaction #{transaction.id}"
      @account.current_balance = @account.current_balance - transaction.amount
      @account.save!
      transaction.destroy
    end
  end
  redirect "/accounts/#{params[:page]}"
end
