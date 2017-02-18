module OrderHelper
  def get_total_cost orders
    if orders
      return orders.map { |o| o.total_cost }.sum
    end
  end
end    