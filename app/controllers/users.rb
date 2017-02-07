class MakersBnB < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password])
    @user.save
    p "User is here", @user
    redirect to ('/')
  end
end
