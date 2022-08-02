class SessionsController < ApplicationController
  def new; end

  def create
    if user = User.authenticate_with_credentials(params[:email].strip.downcase, params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
  #end
  #   user = User.find_by(email: params[:email].downcase)
  #   # finds existing user, checks to see if user can be authenticated
  #   if user.present? && user.authenticate(params[:password])
  #   # sets up user.id sessions
  #     session[:user_id] = user.id
  #     redirect_to root_path, notice: 'Logged in successfully'
  #   else
  #     flash.now[:alert] = 'Invalid email or password'
  #     render :new
  #   end
  # end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end

end