# == Schema Information
#
# Table name: line_items
#
#  id           :integer          not null, primary key
#  commodity_id :integer
#  cart_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quantity     :integer          default(1)
#  order_id     :integer
#

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
