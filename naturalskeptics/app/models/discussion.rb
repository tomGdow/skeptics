# == Schema Information
#
# Table name: discussions
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  introduction       :text
#  description        :text
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  caption            :string(255)
#

class Discussion < ActiveRecord::Base
  attr_accessible :description, :introduction, :title, :user_id, :photo,:caption

    has_attached_file :photo,
                      :styles => {:medium => "300x300>", :thumb => "100x100"},
                      :default_url => "/images/:style/missing.png"

  belongs_to :user
  has_many :comments

  validates :title,
            :description,
            :presence => true

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
