class JobCommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @job_comment = JobComment.new(params[:job_comment])
    @job_comment.job = @job

    if @job_comment.save
      redirect_to job_path(@job)
    else
      redirect_to job_path(@job), notice: (t 'activerecord.errors.create_comment')
    end
  end
end
