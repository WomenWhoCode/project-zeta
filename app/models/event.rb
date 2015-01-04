class Event < ActiveRecord::Base

	validates :title, presence: true
	validates :start_time, presence: true

	has_many :links
	belongs_to :user

	acts_as_taggable

	def username
		return user.name unless user.nil?
		'[deleted]'
	end

	def editable_by?(current_user)
		user == current_user
	end
end
