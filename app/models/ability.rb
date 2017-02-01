class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    alias_action :create, :read, :update, :destroy, to: :crud

      if user.admin?
        can :manage, User, role: role_name_id
      else
       can :read, User, id: user.id
      end
  end

  private
  
  def role_name_id
    Role.find_by(name: "User")
  end  
end
