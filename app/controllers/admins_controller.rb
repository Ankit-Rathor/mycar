 class AdminsController < ApplicationController
  before_action :check_authorization,only: [:index,:show,:destroy]
  # before_action :check_authorization

  def check_authorization
    unless current_user.admin? #mechanics
      redirect_to mechanic_booking_path, notice: "You are not authorized to access this profile."
    end
  end

  def index
    @bookings = Booking.all
  end

  def destroy
    @booking = Booking.find_by(id: params[:id])
    if @booking.destroy
      flash[:notice] = 'deleted succesfully'
      redirect_to admins_path 
    else
      flash[:error] = 'Failed to delete !'   
      render :destroy
    end 
  end  
end
