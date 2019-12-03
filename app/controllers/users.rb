get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

get '/users/login' do
  erb :'sessions/login'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
  else
    @errors = @user.errors.full_messages
    erb :'/sessions/wrong_login'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/index'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
end

delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  logout
  redirect '/'
end