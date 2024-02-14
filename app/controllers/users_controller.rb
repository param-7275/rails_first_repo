class UsersController < ApplicationController
 

  def new_signup
    @user = User.new
  end

  def sign_up 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created Sucessfully! Used the above 
      link to Continue"
      redirect_to sign_up_path
    else
      flash[:error] = @user.errors.full_messages
      redirect_to sign_up_path 
    end
  end

  def new_login
    @user = User.new
  end

  def login
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "Login Sucessfully!"
      redirect_to show_all_employee_path
    else
      flash[:error] = 'Invalid username/password combination'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil       
    redirect_to login_path
  end 
  
  private
  def user_params
    params.require(:user).permit(:username, :email, 
    :password, :password_confirmation)
  end
end
  