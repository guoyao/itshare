class ExperiencesController < ApplicationController
  before_filter :signed_in_user, except: [:index, :show]

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiences }
    end
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @experience = Experience.find(params[:id])
    unless flash[:just_created_or_updated]
      @experience.pageview += 1
      @experience.save
    end
    @comment = Comment.new

    @comments = @experience.comments.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experience }
    end
  end

  def new
    @experience = Experience.new
    @experience.original = true
    @experience.private = false
    @experience.comment_able = true
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def create
    @experience = Experience.new(params[:experience])
    @experience.user = current_user

    if @experience.save
      flash[:just_created_or_updated] = true
      redirect_to @experience
    else
      render action: "new"
    end
  end

  def update
    @experience = Experience.find(params[:id])

    if @experience.update_attributes(params[:experience])
      flash[:just_created_or_updated] = true
      redirect_to @experience
    else
      render action: "edit"
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy

    redirect_to experiences_url
  end

  def new_record_path(for_side_bar = false)
    for_side_bar ? new_experience_path : (%w(index show).include?(action_name) ? new_experience_path : nil)
  end
end
