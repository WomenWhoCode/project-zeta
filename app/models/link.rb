class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url, :user
  
  validates :url, presence: true
  
  belongs_to :user
  
  before_save :maybe_add_protocol
  
  private
    def maybe_add_protocol
      self.url = /^http/.match(self.url) ? self.url : "http://#{self.url}"
    end
  
end
