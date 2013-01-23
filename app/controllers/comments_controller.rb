# encoding: utf-8

class CommentsController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
    @comment = Comment.new(params[:comment])
    @comment.experience = @experience

    if @comment.save
      redirect_to experience_path(@experience)
    else
      redirect_to experience_path(@experience), notice: '评论失败，内容不能为空！'
    end
  end
end
