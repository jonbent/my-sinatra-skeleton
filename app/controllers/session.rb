get '/login' do
  erb :'/sessions/new'
end

# login in session
post '/login' do
  @user = User.find_by(email: params[:user][:email])

  if @user && @user.password == params[:user][:password]
    login(@user)
    redirect "/users/#{current_user.id}"
  else
    erb :'/sessions/wrong_login'
  end
end

# delete a session
delete '/logout' do
  logout
  redirect '/'
end