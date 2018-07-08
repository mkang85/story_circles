class UserController < ApplicationController

  get '/signup' do
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

end
