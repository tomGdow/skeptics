class CombineItemsInCart < ActiveRecord::Migration

  def self.up
    #replace multiple items for a single commodity in a cart with a single item
    Cart.all.each do |cart|
      #count the number of each product in the cart
      sums = cart.line_items.group(:commodity_id).sum(:quantity)
      sums.each do |commodity_id, quantity|
        if quantity > 1
          #remove individual items
          cart.line_items.where(:commodity_id => commodity_id).delete_all
          #replace with a single item
          cart.line_items.create(:commodity_id => commodity_id,
                                 :quantity => quantity)
        end
      end
    end
  end

  def self.down
    #split items with quantity > 1 into multiple items
    LineItem.where("quantity > 1").each do |line_item|
      #add individual items
      line_item.quantity.times do
        LineItem.create :cart_id => line_item.cart_id,
                        :commodity_id => line_item.commodity_id,
                        :quantity => 1
      end
      #remove original item
      line_item.destroy
    end
  end
end
