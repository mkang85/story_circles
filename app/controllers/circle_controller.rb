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
    if params[:you].empty? || params[:need].empty? || params[:go].empty? || params[:search].empty? || params[:find].empty? || params[:take].empty? || params[:return].empty? || params[:change].empty? || !session[:user_id]
      redirect to '/circles/new'
    else
      binding.pry
      @circle = Circle.create(params)
    end
  end

end
