class Discussion < ActiveRecord::Base
  attr_accessible :description, :introduction, :title, :user_id, :photo,:caption

    has_attached_file :photo,
                      :styles => {:medium => "300x300>", :thumb => "100x100"},
                      :default_url => "/images/:style/missing.png"

  belongs_to :user
  has_many :comments

  def uname
    user.email.split('@').first
  end

  def self.search search_query

    if search_query
      find :all, conditions: ["title LIKE ? OR description LIKE ?",
                              "%#{search_query}%", "%#{search_query}%"]
    else
      find :all
    end
  end

end
