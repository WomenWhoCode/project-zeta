class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url, :user
  
  validates :url, presence: true
  
  belongs_to :user
end
