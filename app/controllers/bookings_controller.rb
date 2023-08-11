class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    # binding.pry
    @booking = Booking.new(booking_params)   
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

  private

  def booking_params
    params.require(:booking).permit(:issue, :user_id, :service_id, :car_id)
  end

end
