class MechanicsController < ApplicationController

  before_action :check_authorization
  def check_authorization
    unless current_user.mechanic?
      redirect_to users_path ,method: :delete, notice: "You are not authorized to access this profile."
    end
  end
  def index
    @mech = User.where(role:'mechanic')
  end
  #update booking mechanic
  def assinework
    @mechanic_user = User.find_by(id: params[:mechanic_id])
    @booking = Booking.find_by(id: params[:booking_id])
    @booking.update(mechanic_id: @mechanic_user.id)
    redirect_to mechanics_path, notice: "Request Send Sucessfully"
  end
#view show assine booking  to mechanic 
  def mechanic_booking
    @mechanic_user = User.find_by(id: current_user.id)
    @user_booking = Booking.where(mechanic_id: @mechanic_user.id)
  end
end
