class MakersBnB < Sinatra::Base

  post '/requests' do
    user_id = current_user.id
    p params[:space_id]
    p user_id
    p params[:date]
    Request.create( date: params[:date],
                    status: :unconfirmed,
                    user_id: user_id,
                    space_id: params[:space_id] )
    redirect '/'
  end
end
