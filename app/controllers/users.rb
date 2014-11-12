enable :sessions

get '/user/sign_in' do
  erb :'/user/sign_in'
end

get '/user/log_in' do
  erb :'/user/log_in'
end

post '/user/sign_in' do
  user = User.new
  user.username = params[:username]
  user.password = params[:password]
  user.created_at = Time.now
  user.updated_at = Time.now
  if user.save
    "sign in successful"
    sleep(5)
    redirect "/user/log_in"
  else
    "sign in failed"
    sleep(5)
    redirect back
  end
end

post '/user/log_in' do
  user = User.authenticate(params[:username],params[:password])
  if user != nil
    session[:id] = user.id
    redirect '/'
  else
    "log in failed"
    sleep(5)
    redirect back
  end
end

get '/user/log_out' do
  session[:id] = nil
  redirect '/'
end