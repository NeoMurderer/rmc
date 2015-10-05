class Ability
  include CanCan::Ability

  def initialize(user)
    send user ? :user : :guest
  end

  private

  def guest
    can :create, UserSession
  end

  def user
    can :destroy, UserSession
    can :read, :dashboard
  end
end
