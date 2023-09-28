class MechanicsController < ApplicationController
  # before_action :check_authenticate_mechanic,only: [:mechanic_booking]
  before_action :check_authorization
  # before_action :check_authorization,only: [:index,:show,:destroy]

  def check_authorization
    if current_user.customer?
      redirect_to dash_board_path
    else
      flash[:notice] = 'Sorry your not authorized on this profile '
    end
  end

  def index
    @mech = User.where(role:'mechanic') #show mechanics list
    if current_user.mechanic?
      redirect_to mechanic_booking_path
    else
      flash[:notice] = 'Sorry your not authorized on this profile '
    end
  end
  #update booking mechanic
  def assinework
    mechanic_user = User.find_by(id: params[:mechanic_id])
    booking = Booking.find_by(id: params[:booking_id])
    booking.update(mechanic_id: mechanic_user.id)
    redirect_to mechanics_path, notice: "Request Send Sucessfully"
  end
  #view show assine booking  to mechanic

  def mechanic_booking
    mechanic_user = User.find_by(id: current_user.id)
    @user_booking = Booking.where(mechanic_id: mechanic_user.id)

    if current_user.admin?
      redirect_to admins_path, notice: "You are not authorized to access this profile."
    end
  end

    # private
    # def check_authenticate_mechanic
    #   case current_user.role?
    #   when "admin"
    #     redirect_to admins_path, notice: "You are not authorized to access this profile."
    #   when "customer"
    #     redirect_to dash_board_path, notice: "You are not authorized to access this profile."
    #   end
    # end
end

