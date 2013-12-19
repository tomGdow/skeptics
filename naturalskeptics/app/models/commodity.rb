class Commodity < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :price, :category

  has_many :line_items


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

=begin
  def self.search(search_query)
    if search_query
      find(:all,:conditions => ['name LIKE ?', "%#{search_query}%"])
    else
      find(:all)
    end
  end
=end

=begin
  def self.search(search_query, search)

    if search == "search_name"
    find(:all, :conditions => ["name LIKE ?", "%#{search_query}%"])
    elsif search == "search_category"
      find(:all, :conditions => ["category LIKE ?", "%#{search_query}%"])
    elsif search == "search_description"
      find(:all, :conditions => ["description LIKE ?", "%#{search_query}%"])
    elsif search == "search_all"
      find(:all, :conditions => ["category LIKE ? OR description LIKE ? OR name LIKE ? OR price LIKE ?",
                                 "%#{search_query}%", "%#{search_query}%", "%#{search_query}%",
                                 "%#{search_query}%"])

    else
      find (:all)
    end
  end
=end