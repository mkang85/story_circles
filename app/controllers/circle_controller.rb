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

  get '/circles/new' do
    if !session[:user_id]
      redirect to '/login'
    else
    erb :'/circles/new'
  end
end

  post '/circles' do
    if params[:content].include?("")
      redirect to '/circles/new'
    else
      @circle = Circle.create(content: params[:content], user_id: session[:user_id])
      erb :'/circles/show'
    end
  end

end
