class MakersBnB < Sinatra::Base
  get '/space/new' do
    erb :'space/new'
  end
end
