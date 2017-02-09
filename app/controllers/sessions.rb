class MakersBnB < Sinatra::Base

  get '/sessions/new' do
    @background_class = "sign-in-background"
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to'/'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      @background_class = "sign-in-background"
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end
end
