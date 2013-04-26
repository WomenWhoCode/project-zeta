class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :phone, :about_text, :links

  has_many :links
  
  # add to devise stuff?
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true
  
  validates :name, presence: true
  
end
