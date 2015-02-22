class Link < ActiveRecord::Base

  validates :url, presence: true
  validates :title, presence: true
  
  belongs_to :user
	belongs_to :event
  
  before_save :maybe_add_protocol

  acts_as_taggable

  scope :is_featured, -> { where(featured: true) }

  def username
    return user.name unless user.nil?
    '[deleted]'
  end
  
  def editable_by?(current_user)
    user == current_user
  end
 
  private
    def maybe_add_protocol
      self.url = /^http/.match(self.url) ? self.url : "http://#{self.url}"
    end


  # schema:
  # t.string   "title"
  # t.text     "description"
  # t.string   "url"
  # t.integer  "user_id"
  # t.datetime "created_at"
  # t.datetime "updated_at"
  # t.boolean  "featured",    default: false
end
