class IndexController < ApplicationController
  def index
    @experiences = Experience.recent_articles
    @jobs = Job.recent_articles
    @reviews = Review.recent_articles

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@experiences, @jobs, @reviews] }
    end
  end
end
