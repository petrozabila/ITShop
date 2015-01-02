module ApplicationHelper

  def current_order
    cookies[:order_id].present? ? Order.find(cookies[:order_id]) : nil
  end

  def format_price(price)
    number_to_currency(price, unit: 'грн', separator: ',', format: '%n %u')
  end


end
