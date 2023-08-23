class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
    @user = User.find(params[:user_id])
  end

  def create
    @address = Address.new(address_params) 
    @address.user = current_user
    if @address.save   
      flash[:notice] = 'address added!'   
        redirect_to new_car_path(user_id: current_user)
    else   
      flash[:error] = 'Failed to edit address!'   
      render :new  
    end   
  end     
  
  def update
    @address = Address.find(params[:id])   
    if @address.update(address_params)   
      flash[:notice] = 'address updated!'   
      redirect_to addresses_path(current_user.id)  
    else   
      flash[:error] = 'Failed to edit address!'   
      render :edit   
    end   
  end 

  def edit
    @address = Address.find(params[:id])
  end

  def destroy
    @address = Address.find(params[:id])   
    if @address.destroy
      flash[:notice] = 'deleted succesfully'   
      redirect_to addresses_path(current_user.id)  
    else   
      flash[:error] = 'Failed to delete !'   
      render :destroy   
    end   
  end

  private
  def address_params
    params.require(:address).permit(:city, :location, :house_no, :user_id)
  end
end
