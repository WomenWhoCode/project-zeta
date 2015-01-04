module TagsHelper
	include ActsAsTaggableOn

	# @return ActiveRecord::Relation in a hash for each taggable object
	# {links: , events: }
	def all_obj_with_tag(tag)
		links = Link.tagged_with(tag)
		events = Event.tagged_with(tag)

		{links: links, events: events}
	end

	def all_tag_counts
		# so this is how to return an activerecord from a union
		# the query's not great though, might be able to rewrite w/o the union
		tag_count_union = Link.tag_counts.union(Event.tag_counts)
		tags = Tag.arel_table
		Tag.from(tags.create_table_alias(tag_count_union, :tags))
	end

end