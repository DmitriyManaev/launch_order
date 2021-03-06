require Rails.root.join('lib', 'rails_admin', 'orders_total_cost.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::OrdersTotalCost)

RailsAdmin.config do |config|

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  config.authorize_with do
    unless warden.user.admin?
      flash[:fail] = "Access denied!"
      redirect_to main_app.root_path
    end  
  end

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard do
      statistics false
    end

    index
    
    new do
      only [Course, DailyMenu]
    end
    
    show do
      only [Course, DailyMenu]
    end
    
    edit do
      only [Course, DailyMenu]
    end
    
    delete do
      only [Order, Course, DailyMenu]
    end

    orders_total_cost do
      visible do
        bindings[:abstract_model].model.to_s == "Order"
      end
    end
  end
end

RailsAdmin.config {|c| c.label_methods << :date}