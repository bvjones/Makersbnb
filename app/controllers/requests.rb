class MakersBnB < Sinatra::Base

  post '/requests' do
    user_id = current_user.id
    Request.create( date: params[:date],
                    status: :unconfirmed,
                    user_id: user_id,
                    space_id: params[:space_id] )
    redirect '/'
  end

  get '/requests' do
    @received_requests = current_user.spaces.requests
    erb :'requests/requests'
  end

end
