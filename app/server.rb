class MakersBnB < Sinatra::Base

  enable :sessions
  enable :method_override
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores
  use Rack::MethodOverride

  helpers do
     def current_user
       @current_user ||= User.get(session[:user_id])
     end
  end

  get '/' do
    redirect('/spaces')
  end
end
