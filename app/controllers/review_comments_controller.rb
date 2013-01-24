class ReviewCommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @review_comment = ReviewComment.new(params[:review_comment])
    @review_comment.review = @review
    @review_comment.user = current_user

    if @review_comment.save
      redirect_to review_path(@review)
    else
      redirect_to review_path(@review), notice: (t 'activerecord.errors.create_comment')
    end
  end
end
