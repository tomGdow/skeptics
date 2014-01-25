# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  firstname     :string(255)
#  lastname      :string(255)
#  address       :text
#  email         :string(255)
#  confirm_email :string(255)
#  card_number   :integer
#  card_type     :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Order < ActiveRecord::Base
  attr_accessible :address, :card_number,:card_type,
                  :email_confirmation,:email,:firstname,
                  :lastname

  has_many :line_items, dependent: :destroy

  CARD_TYPES = ['Visa', 'MasterCard', 'PayPal']

  validates   :firstname,
              :lastname,
              :address,
              :card_type,
              :card_number,
              :email,
              :email_confirmation,
               presence: true
  validates   :firstname,
              :lastname,
              :length => {:within => 3..40}
  validates   :card_number,
               numericality: true
  validates   :email,
              :length => {:within => 2..35},
              :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}

  validates_confirmation_of   :email,
                              :length => {:within => 2..35},
                              :message => "and email confirmation must match."

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
