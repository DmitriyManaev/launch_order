module Admin
  class MenuItemsController < BaseController

    def create
      @menu_item = MenuItem.new
      @menu_item.assign_attributes(menu_item_params)
      
      if @menu_item.save
        flash[:success] = "Item added to menu successfully."
      else
        flash[:fail] = "Item not added!"
      end 

      redirect_to admin_daily_menus_path
    end

    def destroy
      menu_item = MenuItem.where(params.permit(:course_id, :daily_menu_id)).first
      
      if menu_item && menu_item.destroy
        flash[:success] = "Item deleted from menu."
      else
        flash[:fail] = "Error! Item not deleted from menu."
      end

      redirect_to admin_daily_menus_path  
    end

    private

    def menu_item_params
      params.require(:menu_item).permit(:course_id, :daily_menu_id)
    end

  end
end