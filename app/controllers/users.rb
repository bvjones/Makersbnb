class MakersBnB < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password])
    redirect to ('/')
  end
end
