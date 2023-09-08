class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :redirect_if_authenticated, only: [:new, :create]

  def new
    @user = User.new
    @booking = Booking.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to new_admin_path
      elsif @user.mechanic?
        redirect_to mechanic_booking_path
      elsif @user.customer?
        redirect_to new_car_path(current_user.id), flash: { success: 'Logged in successfully' }
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