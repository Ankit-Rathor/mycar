
class Ability
  include CanCan::Ability

  def initialize(user)
    if current_user.admin?
      can :manage, :all
    elsif current_user.mechanic?
      can :manage, :mechanic_booking
    elsif current_user.customer?
      can :manage, :Users
    end
  end
end
