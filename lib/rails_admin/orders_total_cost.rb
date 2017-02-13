require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
 
module RailsAdmin
  module Config
    module Actions
      class OrdersTotalCost < RailsAdmin::Config::Actions::Base

        register_instance_option :bulkable? do
          true
        end

        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config)
            @total_cost = 0

            @objects.each do |object|
              @total_cost += object.total_cost
            end
            
            redirect_to back_or_index, notice: "Total cost: #{@total_cost}"
          end
        end
      end
    end
  end
end