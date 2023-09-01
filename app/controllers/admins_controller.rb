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
    @user = User.new
  end

  def create
  end

  def update
    @user = User.find(params[:id])   
    if @user.update(user_params)   
      redirect_to admins_path   
    else   
      flash[:error] = 'Failed to edit car!'   
      render :edit   
    end  
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    binding.pry
    @user = User.find(params[:id])
    @user.bookings.destroy_all
    if @user.destroy
      flash[:notice] = 'deleted succesfully'   
    else   
      flash[:error] = 'Failed to delete !'   
      render :destroy   
    end 
  end  
end
