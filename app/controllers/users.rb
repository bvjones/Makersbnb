class MakersBnB < Sinatra::Base
  get '/users/new' do
    @background_class = "sign-up-background"
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password_digest: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      @background_class = "sign-up-background"
      erb :'users/new'
    end
  end
end
