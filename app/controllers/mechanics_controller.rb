class MechanicsController < ApplicationController
  def index
    @mech = User.where(role:'mechanic')
    # @bookings = Booking.includes(:mechanic)
    # # @cust_id =  params[:id]
    # @bookings = Booking.all
  end

  def show
    # @user = User.find(params[:id])   
  end

  def assinework
    @mechanic_user = User.find_by(id: params[:mechanic_id])
    @booking = Booking.find(params[:booking_id])
    @booking.update(mechanic_id: @mechanic_user.id)
    redirect_to mechanics_path, notice: "Request Send Sucessfully"
  end
  
  def mechanic_booking
    # @mechanic_user = User.find_by(id: params[:mechanic_id])
    # @booking = Booking.where(mechanic_id: @mechanic_user.id).all
    @mechanic_user = User.find_by(id: current_user.id)
    @user_booking = Booking.where(mechanic_id: @mechanic_user.id)
    # car_id = Booking.find_by(mechanic_id: @mechanic_user.id).car_id
    # @user_booking = User.find(user_id)
    # @car_booking = Car.find(car_id)   
    # @user_mechanic = User.find_by(id: current_user.id) 
    # assign_user = User.find(params[:mechanic_id]) 
    # assign_work = Booking.find(params[:booking_id]).update(user_id: assign_user.id)
  end

  def service_details
    binding.pry
    @services= Service.all
    @service =Service.find_by( params[:service_id])
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
