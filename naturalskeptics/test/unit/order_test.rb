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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
