require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "allstoriesarethesame"
  end

  get '/' do
    redirect to :'/circles'
  end

  get '/info' do
    if logged_in?
    @user = User.find(session[:user_id])
    erb :'/info'
    else
      redirect to '/signup'
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

end
