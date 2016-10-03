class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def login
    @user = User.new
  end

  def loginn
    # binding.pry
    @user = User.find_by(username: user_params[:username])
    if @user
      if @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        @password_error = true
        render 'login'
      end
    else
      @username_error = true
      render 'login'
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
