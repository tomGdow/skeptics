class Order < ActiveRecord::Base
  attr_accessible :address, :card_number,:card_type,
                  :confirm_email,:email,:firstname,
                  :lastname

  has_many :line_items, dependent: :destroy

  CARD_TYPES = ['Visa', 'MasterCard', 'PayPal']

  validates   :firstname,:lastname,
              :address,:card_type,
              :card_number,:email,
              :confirm_email,:address,
               presence: true
  validates   :firstname,
              :lastname,
              :length => {:within => 3..40}
  validates   :card_number,
               numericality: true
  validates   :email,
              :length => {:within => 2..35},
              :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
  validates   :confirm_email,
              :length => {:within => 2..35},
              :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
