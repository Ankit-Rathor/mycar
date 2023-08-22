class UsersController < ApplicationController
  skip_before_action :authenticate_user,only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
    @user.build_address
  end

  def create

    @user = User.new(user_params) 
    if @user.save
      flash[:notice] = 'user added!'   
      redirect_to new_car_path
    else   
      flash[:error] = 'Failed to edit product!'   
      render :new   
    end   
  end   
  
  def update
    @user = User.find(params[:id])   
    if @user.update(user_params)   
      flash[:notice] = 'user updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit user!'   
      render :edit   
    end   
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])   
    if @user.delete   
      flash[:notice] = 'deleted succesfully'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete !'   
      render :destroy   
    end   
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:contact, :role, address_attributes: [:id, :city,:location,:house_no,:user_id])
  end
end
