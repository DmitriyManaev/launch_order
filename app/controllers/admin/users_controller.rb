class Admin::UsersController < ApplicationController
  layout "admin"
  load_resource param_method: :my_sanitizer, only: :index
  
  def index
  end

  private

  def my_sanitizer
    params.require(:user).permit(:name, :email)
  end

end
