class MessagesController < ApplicationController

  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :correct_user

  def index
    @user = User.find_by_id(params[:user_id])
    @received_messages = @user.received_messages.paginate(page: params[:page])

    respond_to do |format|
      format.html { render layout: 'user_space' }
      format.json { render json: @received_messages }
    end
  end

  def new
    @message = Message.new
  end

  def create
    user = User.find(params[:user_id])
    @message = Message.new(params[:message])
    @message.from_user = current_user
    @message.to_user = user
    @message.save
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to user_messages_path(current_user)
  end

  private

  def correct_user
    user = User.find_by_id(params[:user_id])
    redirect_to user_path(user) unless current_user?(user)
  end
end