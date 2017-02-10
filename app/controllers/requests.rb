class MakersBnB < Sinatra::Base

  post '/requests' do
    user_id = current_user.id
    @space = Space.get(params[:space_id])
    if !@space.booked_dates.include?(params[:date])
      Request.create( date: params[:date],
                      status: :unconfirmed,
                      user_id: user_id,
                      space_id: params[:space_id] )
      flash.keep[:notice]="Your request has been sent!"
      redirect '/'
    else
      flash.keep[:error] = ["The selected date is not available"]
      @background_class = "requests-background"
      redirect '/requests'
    end
  end

  get '/requests' do
    @received_requests = current_user.spaces.requests
    @made_requests = current_user.requests
    @background_class = "requests-background"
    erb :'requests/requests'
  end

  get '/requests/:id' do
    @single_request = Request.get(params['id'])
    @background_class = "request-background"
    erb :'requests/request'
  end

  patch '/requests/:id' do
    Request.get(params['id']).update(status: params[:update_status])
    flash.keep[:notice] = "Request has been #{params[:update_status]}"
    redirect '/requests'
  end
end
