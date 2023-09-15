class ServicesController < ApplicationController 
  def index
    @services = Service.all # show all services
  end
  
  def new
    @service = Service.new
  end
  #sevice status confirm this method
  def confirm_service
    @service = Service.find_by(id: params[:id])
    @service.update(status: 'confirm')
    redirect_to service_history_path
  end
  # service status cancel this method
  def cancel_service
    @service= Service.find_by(id: params[:id])
    @service.update(status: 'cancelled')
    redirect_to service_history_path
  end

  def create
    #booking id to service find
    @booking = Booking.find_by(id: params[:service][:booking_id])
    @mechanic = @booking.mechanic_id #  update booking in mechanic_id
    @service = Service.new(service_params)

    if @service.save
      @booking.update(service_id: @service.id) #update service id in booking
      redirect_to mechanic_booking_path 
    else   
      render :new   
    end  
  end

  def service_history
    @bookings_service = Booking.joins(:service)
  end

  private
  def service_params
    params.require(:service).permit(details: {}) 
  end
end

