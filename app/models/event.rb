class Event < ActiveRecord::Base
	has_many :links
	belongs_to :user

	acts_as_taggable
end
