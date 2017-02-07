class MakersBnB < Sinatra::Base
  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = current_user.spaces.create(name: params[:name],
                                       description: params[:description],
                                       price: params[:price],
                                       from: params[:from],
                                       to: params[:to]
                                      )
    if space.save
      redirect '/'
    else
      flash[:error] = space.errors.full_messages
      redirect '/spaces/new'
    end
  end
end
