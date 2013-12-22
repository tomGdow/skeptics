# == Schema Information
#
# Table name: commodities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  price       :float
#  image_url   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category    :string(255)
#

require 'test_helper'

class CommodityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
