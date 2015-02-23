class StaticPagesController < ApplicationController
  def home
  end

  def tutorials
    tutorial_levels = %w{beginner intermediate advanced}

    tutorials = Link.tagged_with('tutorial').is_featured

    # noinspection RubyStringKeysInHashInspection
    @featured_tutorials = {'all' => []}

    tutorial_levels.each do |level|
      @featured_tutorials[level] = []
    end

    tutorials.each do |tutorial|
      @featured_tutorials['all'] << tutorial
      level = (tutorial_levels & tutorial.tags.map{|tag| tag.to_s}).first
      @featured_tutorials[level] << tutorial unless level.nil?
    end
  end
end
