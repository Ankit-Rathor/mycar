class ServicesController < ApplicationController

  def index
    @services = Service.all
  end
  
  def new
    @service = Service.new
  end

  def create
    binding.pry
    @booking = Booking.find(params[:service][:booking_id])
    @mechanic = @booking.mechanic_id
    @service = Service.create(service_params)

    if @service.save
      @booking.update(service_id: @service.id)
      redirect_to service_history_path
    else   
      render :new   
    end  
  end

  def service_history
  # @services = Service.all
  @bookings_service = Booking.joins(:service)
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private
  def service_params
    params.require(:service).permit(details: {}) 
  end

  # def booking_params
  #   params.require(:service).permit(:booking_id)
  # end
end

