# == Schema Information
#
# Table name: friends
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  is_admin               :boolean
#  avatar                 :string
#

class Friend < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :name, :avatar
  has_many :tweets
  has_many :photos
  
  mount_uploader :avatar, AvatarUploader

  def admin?
  	is_admin? || "moira.hicks@gmail.com" == self.email || "darren.hicks@gmail.com" == self.email
  end
  
  def self.online_friends
    Friend.order("name").where('updated_at > ?', 12.seconds.ago)
  end

end
