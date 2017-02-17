module Admin
  class UsersController < BaseController
    
    def index
      role_id = Role.find_by_name("User").id
      @users = User.select("id, name, email").where(role_id: role_id)
    end
  end
end
