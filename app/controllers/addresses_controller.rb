class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)   
    if @address.save   
      flash[:notice] = 'address added!'   
      redirect_to addresses_path   
    else   
      flash[:error] = 'Failed to edit address!'   
      render :new  
    end   
  end   

  def update
    @address = Address.find(params[:id])   
    if @address.update(address_params)   
      flash[:notice] = 'address updated!'   
      redirect_to addresses_path   
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
    if @address.delete   
      flash[:notice] = 'deleted succesfully'   
      redirect_to addresses_path   
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
