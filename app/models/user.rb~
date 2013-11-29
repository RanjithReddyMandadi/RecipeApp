class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
  # attr_accessible :title, :body
  has_many :recipes, :dependent => :destroy

  after_create :send_user_mailer
  #after_update :update_user_mailer
  after_destroy :destroy_user_mailer
  
  mount_uploader :avatar, AvatarUploader
  def send_user_mailer
     
    UserMailer.send_mailer(self).deliver
  
  end
  
  def update_user_mailer
  
    UserMailer.update_mailer(self).deliver
  
  end

  def destroy_user_mailer
    
    UserMailer.destroy_mailer(self).deliver
  
  end
end
