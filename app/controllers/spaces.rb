class MakersBnB < Sinatra::Base

  helpers do
    def recent_spaces
      @recent_spaces ||= Space.last(50)
    end
  end

  get '/spaces' do
    @current_user = current_user
    @background_class = "index-background"
    erb :index
  end

  get '/spaces/new' do
    @background_class = "list-new-space-background"
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
      Messenger.call(current_user, "create_new_space")
      redirect '/'
    else
      flash[:error] = space.errors.full_messages
      @background_class = "list-new-space-background"

      redirect '/spaces/new'
    end
  end

  get '/spaces/:id' do
    @space = Space.get(params['id'])
    @background_class = "space-background"
    erb :'spaces/space'
  end
end
