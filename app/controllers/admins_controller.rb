class AdminsController < ApplicationController
  def index
    @users = User.all
    @cars = Car.all
    @addresses = Address.all
    @bookings = Booking.all
    @services = Service.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete   
      flash[:notice] = 'deleted succesfully'   
    else   
      flash[:error] = 'Failed to delete !'   
      render :destroy   
    end 
  end
end
