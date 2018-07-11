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
    erb :'/info'
  end

end
