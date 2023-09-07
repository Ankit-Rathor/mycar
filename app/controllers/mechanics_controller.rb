class MechanicsController < ApplicationController
  def index
    binding.pry
    @mech = User.where(role:'mechanic')
  end

  def show
  end

  def assinework
    @mechanic_user = User.find_by(id: params[:mechanic_id])
    @booking = Booking.find(params[:booking_id])
    @booking.update(mechanic_id: @mechanic_user.id)
    redirect_to mechanics_path, notice: "Request Send Sucessfully"
  end
  
  def mechanic_booking
    @mechanic_user = User.find_by(id: current_user.id)
    @user_booking = Booking.where(mechanic_id: @mechanic_user.id)
  end

  def new
  end

  def create
  end
  def update 
  end

  def edit
  end

  def destroy
  end
end
