class UsersController < ApplicationController
  load_resource param_method: :my_sanitizer, :only => :get_users_list

  def profile
  end
  
  def get_users_list
    respond_to do |format|
      format.js 
    end  
  end

  private

  def my_sanitizer
    params.require(:user).permit(:name, :email)
  end

end
