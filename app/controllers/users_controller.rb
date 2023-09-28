class UsersController < ApplicationController
  skip_before_action :authenticate_user,only: [:new, :create]
  before_action :check_authorization
  # skip_before_action :check_authorization, only: [:new,:create,:update,:edit,:show]

  def check_authorization
    binding.pry
    if current_user.present? && current_user.customer? #admin
      # redirect_to admins_path , notice: "You are not authorized to access this profile."
    end
  end

  def index
    @users = User.all
    if current_user.customer?
      redirect_to dash_board_path
    end
  end

  def show
    user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
    @user.build_address
  end

  def create
    user = User.new(user_params)
    if user.save
      UserConfirmationMailer.user_confirmation_email(user).deliver_now
      flash[:notice] = 'user added sucesfully!'
      redirect_to new_car_path
    else
      flash[:error] = 'error'
      render :new
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      flash[:notice] = 'user updated!'
      redirect_to user_path
    else
      flash[:error] = 'Failed to edit user!'
      render :edit
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy
      flash[:notice] = 'deleted succesfully'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete !'   
      render :destroy   
    end   
  end

  private
  def user_params
    params.require(:user).permit(:id,:name, :email, :password,:contact, :role, address_attributes: [:id, :city,:location,:house_no,:user_id])
  end
end
