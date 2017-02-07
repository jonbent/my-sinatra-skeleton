#Get to a reg.user page
get '/users' do
  erb :'users/index'
end

#Get to a reg.user page
get '/users/new' do
  erb :'users/new'
end

#Get to new rout
get '/users/login' do
  erb :'sessions/login'
end

#Create a new user from form
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/sessions/wrong_login'
  end
end

#Get to user profile
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/index'
end

#Get to update view
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

#Update user
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
  redirect "/users/#{@user.id}"
end

#delete user
delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  logout
  redirect '/'
end