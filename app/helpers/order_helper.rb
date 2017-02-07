module OrderHelper
  private

  def get_total_cost orders
    if orders
      orders.map { |o| o.total_cost }.sum
    end
  end
end