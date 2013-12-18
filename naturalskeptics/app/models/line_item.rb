class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :commodity_id, :commodity, :quantity

  belongs_to :commodity
  belongs_to :cart

  def total_price_lineItem
    commodity.price * quantity
  end

end
