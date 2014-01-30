# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  foto_file_name         :string(255)
#  foto_content_type      :string(255)
#  foto_file_size         :integer
#  foto_updated_at        :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :remember_me, :foto

  has_attached_file :foto,
                    :styles => {:medium => "300x300>", :thumb => "100x100"},
                    :default_url => "/images/:style/missing.png"

  has_many :discussions
  has_many :comments

  def self.search search_query

    if search_query
      find :all, conditions: ["email LIKE ?",
                              "%#{search_query}%"]
    else
      find :all
    end
  end



end
