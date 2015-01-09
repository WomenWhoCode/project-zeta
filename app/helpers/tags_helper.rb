module TagsHelper
	include ActsAsTaggableOn

	# @return ActiveRecord::Relation in a hash for each taggable object
	# {links: , events: }
	def all_obj_with_tag(tag)
		links = Link.tagged_with(tag)
		events = Event.tagged_with(tag)

		{links: links, events: events}
	end

	def tag_counts_combined
		# SQL:
		# select tags.*, taggings.tags_count as count
		# from "tags" join (
	  #			select taggings.tag_id, count(taggings.tag_id) as tags_count
		#			from "taggings"
		#			where taggings.taggable_type in ('Link', 'Event')
		#						and taggings.context = 'tags'
		#						and (taggings.taggable_id in (select links.id from "links") or taggings.taggable_id in (select events.id from "events"))
		# 		group by taggings.tag_id
		# 		having count(taggings.tag_id) > 0
		# ) as taggings
		# on taggings.tag_id = tags.id

		links = Link.arel_table
		events = Event.arel_table
		# tag stuff doesn't inherit from activerecord
		taggings = Arel::Table.new('taggings')
		tags = Arel::Table.new('tags')

		tagging_subselect = taggings.where(taggings[:context].eq('tags'))
						.where(taggings[:taggable_type].in(['Link', 'Event']))
						.where(taggings[:taggable_id].in(links.project(links[:id]))
									 .or(taggings[:taggable_id].in(events.project(events[:id]))))
						.group(taggings[:tag_id])
						.having(taggings[:tag_id].count.gt(0))
						.project(taggings[:tag_id], taggings[:tag_id].count.as('tags_count')).as('taggings')

		tag_join = tags.join(tagging_subselect)
				.on(taggings[:tag_id].eq(tags[:id]))
				.project(tags[:id].as('id'), tags[:name].as('name'), taggings[:tags_count].as('count'))
				.order(tags[:name])

		# if there's a better way to do this Arel::SelectManager -> ActiveRecord thing, I'm dying to hear it
		Tag.find_by_sql(tag_join.to_sql)
	end

end