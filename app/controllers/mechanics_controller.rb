class MechanicsController < ApplicationController
  def index
    @cust_id =  params[:id]
    @mech = User.where(role:'mechanic')
    @bookings = Booking.all
  end

  def show
    @user = User.find(params[:id])   
  end

  def assinework
    binding.pry
    @user = User.find_by(current_user.id)
    # @booking = Booking.find_by(id: params[:user_id])
    # @booking = Booking.find(params[:customer_id])
    @booking = Booking.where(mechanic_id: current_user.id)  

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
