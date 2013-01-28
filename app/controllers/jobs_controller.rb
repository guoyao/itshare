class JobsController < ApplicationController
  before_filter :signed_in_user, except: [:index, :show]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])
    unless flash[:just_created_or_updated]
      @job.pageview += 1
      @job.save
    end
    @job_comment = JobComment.new

    @job_comments = @job.job_comments.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  def new
    @job = Job.new
    @job.original = true
    @job.private = false
    @job.comment_able = true
  end

  def edit
    @job = Job.find_by_id_and_user_id(params[:id], current_user.id)
    if @job.nil? then
      redirect_to root_path
    end
  end

  def create
    @job = Job.new(params[:job])
    @job.user = current_user

    if @job.save
      flash[:just_created_or_updated] = true
      redirect_to @job
    else
      render action: "new"
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update_attributes(params[:job])
      flash[:just_created_or_updated] = true
      redirect_to @job
    else
      render action: "edit"
    end
  end

  def destroy
    @job = Job.find_by_id_and_user_id(params[:id], current_user.id)
    if @job.nil? then
      redirect_to root_path
    end
    @job.destroy

    redirect_to jobs_url
  end

  def new_record_path(for_side_bar = false)
    for_side_bar ? new_job_path : (%w(index show).include?(action_name) ? new_job_path : nil)
  end
end
