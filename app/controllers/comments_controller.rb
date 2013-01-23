class CommentsController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
    @comment = Comment.new(params[:comment])
    @comment.experience = @experience

    if @comment.save
      redirect_to experience_path(@experience)
    else
      redirect_to experience_path(@experience), notice: (t 'activerecord.errors.create_comment')
    end
  end
end
