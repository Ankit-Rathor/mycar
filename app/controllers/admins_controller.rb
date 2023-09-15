class AdminsController < ApplicationController
  before_action :check_authenticate_user

  def check_authenticate_user
    unless current_user.admin?
      redirect_to error_path ,method: :delete, notice: "You are not authorized to access this profile."
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
