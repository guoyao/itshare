class CommentsController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
    @comment = Comment.new(params[:comment])
    @comment.experience = @experience
    @comment.user = current_user

    if @comment.save
      redirect_to @experience
    else
      redirect_to @experience, notice: (t 'activerecord.errors.create_comment')
    end
  end
end
