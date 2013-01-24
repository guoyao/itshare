class IndexController < ApplicationController
  def index
    @experiences = Experience.limit(10)
    @jobs = Job.limit(10)
    @reviews = Review.limit(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@experiences, @jobs, @reviews] }
    end
  end
end
