module Admin
  class BaseController < ApplicationController
    layout "admin"
    before_filter :verify_admin
    
    private
    
    def verify_admin
      unless current_user.admin?
        flash[:fail] = "Access denied!"
        redirect_to root_url 
      end
    end
  end
end