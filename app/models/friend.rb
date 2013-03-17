class Friend < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :avatar
  has_many :tweets

  mount_uploader :avatar, AvatarUploader

  def admin?
  	is_admin? || "moira.hicks@gmail.com" == self.email || "darren.hicks@gmail.com" == self.email
  end
  
  def self.online_friends
    Friend.order("name").where('updated_at > ?', 12.seconds.ago)
  end

end
