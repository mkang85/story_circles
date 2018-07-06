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
    if params[:hero].include?("")
      redirect to '/circles/new'
    else
      @circle = Circle.create(you: params["hero"][0], need: params["hero"][1], go: params["hero"][2], search: params["hero"][3], find: params["hero"][4], take: params["hero"][5], return: params["hero"][6], change: params["hero"][7], user_id: session[:user_id])
      erb :'/circles/show'
    end
  end

end
