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

class Commodity < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :price, :category

  has_many :line_items

  validates :name,
            :category,
            :description,
            :price,
            :presence => true

  validates :description,
            :length => { :minimum => 10 }

  validates :price,
            :numericality => {:greater_than_or_equal_to => 1 }


  def self.search(search_query, search)

    case search

      when "search_name"
        find :all, conditions: ["commodities.name LIKE ?", "%#{search_query}%"]

      when "search_category"
        find :all, conditions: ["category LIKE ?", "%#{search_query}%"]

      when "search_description"
        find :all, conditions: ["description LIKE ?", "%#{search_query}%"]

      when "search_all"
        find :all, conditions: ["name LIKE ? OR category LIKE ? OR price LIKE ? OR description LIKE ?",
                                "%#{search_query}%",
                                "%#{search_query}%",
                                "%#{search_query}%",
                                "%#{search_query}%"]
      else
        find :all
    end
  end

end


