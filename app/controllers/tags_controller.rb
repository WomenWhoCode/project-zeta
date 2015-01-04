class TagsController < ApplicationController
	include TagsHelper

	def show
		tagged_objs = all_obj_with_tag(params[:tag])
		@links = tagged_objs[:links]
		@events = tagged_objs[:events]
  end
end