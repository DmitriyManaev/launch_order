class UsersController < ApplicationController
  load_resource param_method: :my_sanitizer, :only => :profile

  def profile
  end

  private

  def my_sanitizer
    params.require(:user).permit(:name, :email)
  end

end
