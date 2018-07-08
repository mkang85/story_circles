class UserController < ApplicationController

  get '/signup' do
    if session[:user_id]
      redirect :'/circles'
    end
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect :'/signup'
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
    erb :'/users/login'
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



get '/logout' do
  session.clear
  redirect :'/login'
end

end
