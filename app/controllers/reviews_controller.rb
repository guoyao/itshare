class ReviewsController < ApplicationController
  before_filter :signed_in_user, except: [:index, :show]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new

    @review_comments = @review.review_comments.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  def new
    @review = Review.new
    @review.original = true
    @review.private = false
    @review.comment_able = true
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(params[:review])
    @review.user = current_user

    if @review.save
      redirect_to @review
    else
      render action: "new"
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to @review
    else
      render action: "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to reviews_url
  end

  def new_record_path(for_side_bar = false)
    for_side_bar ? new_review_path : (%w(index show).include?(action_name) ? new_review_path : nil)
  end
end
