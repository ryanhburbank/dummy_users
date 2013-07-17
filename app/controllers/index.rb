get '/' do
  erb :index
  # This page has create account in erb and login
  # let's do two separate forms
end

post '/user' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:id] = @user.id
    redirect to ("/secret")
  else
    #how do we make this a popup w/o using flash gem
    error("password/email combination wrong/nonexistant") 
    rest(2.0)
    redirect to ("/")
  end
  #how does the session part work here
  #redirect user to '/secret'
end

post '/create/user' do
  #create user on this route
  #return the user to '/'
end

get '/secret' do
  if session[:id]
    erb :secret
  else
    alert("you must be logged in to view this page")
    redirect to ("/")
  end
end
 
post '/secret' do
  #this path sets the session.id = nil
  #redirects to '/' when clicked
end
 #want to try the use you created in console?
