class IndexController < ApplicationController
  def index
    @experiences = Experience.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiences }
    end
  end
end
