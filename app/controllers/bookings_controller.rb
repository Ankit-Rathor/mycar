class BookingsController < ApplicationController
  def index
    @bookings = Booking.includes(:mechanic)
    @bookings = Booking.all
    if current_user.customer?
      @bookings = Booking.where(user_id: current_user.id)
    elsif current_user.mechanic?
      @bookings = Booking.where(mechanic_id: current_user.id)
    elsif current_user.admin?
      @bookings= Booking.all
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end
  
  def create
    @booking = Booking.create(booking_params)
    if @booking.save   
      flash[:notice] = 'booking added!'
      redirect_to bookings_path         
    else   
      flash[:error] = 'Failed to edit !'   
      render :new   
    end  
  end 
  
  def update
    @booking = Booking.find(params[:id])   
    if @booking.update(booking_params)   
      flash[:notice] = 'booking updated!'   
      redirect_to bookings_path   
    else   
      flash[:error] = 'Failed to edit car!'   
      render :edit   
    end   
  end   

  def edit
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])   
    if @booking.delete   
      flash[:notice] = 'deleted succesfully'   
      redirect_to bookings_path   
    else   
      flash[:error] = 'Failed to delete !'   
      render :destroy   
    end   
  end

  def confirm
    @booking = Booking.find(params[:format])
    if @booking.update(status: 'confirmed')
      redirect_to admins_path
    else
      flash[:notice] = "pending"
    end
  end

  def cancel
    @booking = Booking.find(params[:format])
    @booking.update(status: 'cancelled')
    redirect_to admins_path
  end
  
  def work
    @booking = Booking.find(params[:format])

  end
  private
  def booking_params
    params.require(:booking).permit(:issue, :date, :user_id, :service_id, :car_id, :mechanic_id)
  end
end