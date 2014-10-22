class Event < ActiveRecord::Base
	has_many :links

	acts_as_taggable
end
