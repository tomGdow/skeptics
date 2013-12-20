class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :commodity_id, :commodity, :quantity

  belongs_to :commodity
  belongs_to :cart
  belongs_to :order

  def total_price_lineItem
   sales_price.to_f * quantity
  end

  ##Dowstore.priceMarkup functionality comes from priceMarkup gem

  def sales_price
    Dowstore.priceMarkup(commodity.price,0.45,2)
  end

end
