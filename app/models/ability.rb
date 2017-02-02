class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    alias_action :create, :read, :update, :destroy, to: :crud

      if user.admin?
        can :manage, User, role: role_user
      else
        can :read, User, id: user.id
      end
  end

  private
  
  def role_user
    Role.find_by_name("User")
  end  
end
