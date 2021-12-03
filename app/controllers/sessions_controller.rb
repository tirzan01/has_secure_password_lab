class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:user][:name]
    return redirect_to '/login' if name.nil? || name == ''
    user = User.find_by(name: name)
    return head(:forbidden) unless user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect_to '/'
  end

  def destroy
    session.delete(:name, :password)
  end
end

# @user = User.find_by(name: name)
# session[:user_id] = @user.id