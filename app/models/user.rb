class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :phone, :about_text
  
  before_save :create_remember_token
  
  # add to devise stuff?
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true
  
  validates :name, presence: true
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
end
