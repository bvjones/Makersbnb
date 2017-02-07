class MakersBnB < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password_digest: params[:password])
    if @user.save
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
