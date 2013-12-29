class Comment < ActiveRecord::Base
  attr_accessible :date, :discussion_id, :text, :user_id

  belongs_to :discussion
  belongs_to :user

  def uname
    user.email.split('@').first
  end


  def self.search search_query
    if search_query
      find :all, conditions: ['text LIKE ?', "%#{search_query}%"]
    else
      find :all
    end
  end

end
