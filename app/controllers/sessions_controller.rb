class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :redirect_if_authenticated, only: [:create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user.present? && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to new_admin_path, flash: { success: 'Logged in successfully' }
      elsif user.mechanic?
        redirect_to mechanic_booking_path, flash: { success: 'Logged in successfully' }
      elsif user.customer?
        redirect_to dash_board_path, flash: { success: 'Logged in successfully' }
      end
    else
     render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, flash: { success: 'Logged Out' }
  end
end
