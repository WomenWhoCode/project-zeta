class User < ActiveRecord::Base
  attr_accessible :description, :email, :name, :phone, :about_text,
                  :password, :password_confirmation
  has_secure_password
  
  before_save :create_remember_token
  
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
end
