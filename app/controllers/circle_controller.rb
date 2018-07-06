class CircleController < ApplicationController
  get '/circles' do
    if !session[:user_id]
      redirect :'/login'
    else
      @circles = Circle.all
      @user = User.find(session[:user_id])
      erb :'/circles/index'
    end
  end
end
