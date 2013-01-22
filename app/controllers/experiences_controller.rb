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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experience }
    end
  end

  def new
    @experience = Experience.new
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def create
    @experience = Experience.new(params[:experience])
    @experience.user = current_user

    if @experience.save
      redirect_to @experience, notice: 'Experience was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @experience = Experience.find(params[:id])

    if @experience.update_attributes(params[:experience])
      redirect_to @experience, notice: 'Experience was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy

    redirect_to experiences_url
  end
end
