class UserController < ApplicationController

  get '/signup' do
    if session[:user_id]
      redirect :'/circles'
    end
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
         flash[:message] = "Please fill all fields!"
      redirect :'/signup'
    end
    User.all.each do |user|
      if user.username == params[:username]
        redirect :'/signup'
      end
    end
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect :'/login'
  end

  get '/login' do
    if params.empty?
      redirect :'/signup'
    elsif session[:user_id]
      redirect to '/circles'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user &&  @user.authenticate(params[:password])
      session[:user_id] = @user.id
       redirect to '/circles'
    else
      redirect to :'/signup'
  end
end

get "/users/:slug" do
  @user = User.find_by_slug(params[:slug])
  @circles = @user.circles
  erb :'/users/homepage'
  end


get '/logout' do
  session.clear
  redirect :'/login'
end

end
