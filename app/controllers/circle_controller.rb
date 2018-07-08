class CircleController < ApplicationController
  get '/circles' do
    if !session[:user_id]
      redirect :'/login'
    else
      binding.pry
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
      @circle = Circle.create(params)
      @circle.user_id = session[:user_id]
      erb :'/circles/show'
    end
  end

  get '/circles/:id' do
  if !session[:user_id]
    redirect to '/login'
  else
  @circle = Circle.find(params[:id])
  erb :'/circles/show'
  end
end

get '/circles/:id/edit' do
  if !session[:user_id]
  redirect to '/login'
  else
    @circle = Circle.find(params[:id])
    erb :'/circles/edit'
  end
end


patch '/circles/:id' do
  @circle = Circle.find(params[:id])
  if params[:you].empty? || params[:need].empty? || params[:go].empty? || params[:search].empty? || params[:find].empty? || params[:take].empty? || params[:return].empty? || params[:change].empty? || !session[:user_id]
    redirect to "/circles/#{@circle.id}/edit"
  else
  @circle.you = params[:you]
  @circle.need = params[:need]
  @circle.go = params[:go]
  @circle.search = params[:search]
  @circle.find = params[:find]
  @circle.take = params[:take]
  @circle.return = params[:return]
  @circle.change = params[:change]
  @circle.save
  redirect to "/circles/#{@circle.id}"
  end
end

# delete '/circles/:id' do
#   binding.pry
#   @user = User.find_by(session[:user_id])
#   @circle = Circle.find(params[:id])
#   binding.pry
#   if session[:user_id] && @user.circles.include?(@circle)
#   @circle.destroy
#   else
#   puts "Sorry, cannot delete circle"
#   end
# end

end
