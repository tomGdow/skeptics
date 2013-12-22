# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, :dependent => :destroy

  def add_commodity(commodity)
    current_item = line_items.where(:commodity_id => commodity.id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:commodity_id => commodity.id)
      line_items << current_item
    end
    current_item
  end

  def total_price
    total = 0

    line_items.each do |line_item|
      #total += line_item.commodity.price * line_item.quantity
      total += line_item.sales_price.to_f * line_item.quantity

    end
    total
  end



end
