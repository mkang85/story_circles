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
    redirect :'/circles'
  end

  get '/login' do
    erb :'/users/login'
  end

end
