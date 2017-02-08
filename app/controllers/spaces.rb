class MakersBnB < Sinatra::Base

  helpers do
    def recent_spaces
      @recent_spaces ||= Space.last(50)
    end
  end

  get '/spaces' do
    @current_user = current_user
    erb :index
  end

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

  get '/spaces/:id' do
    @space = Space.get(params['id'])
    erb :'spaces/space'
  end
end
