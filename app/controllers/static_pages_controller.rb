class StaticPagesController < ApplicationController
  def home
  end

  def tutorials
    @featured_tutorials = Link.tagged_with('tutorial').is_featured
  end
end
