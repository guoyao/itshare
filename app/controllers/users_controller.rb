# encoding: utf-8

class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    if signed_in? then
      redirect_to root_path
    end
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to root_path, notice: '恭喜你，注册成功！'
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])
  end

  private

  def correct_user
    @user = User.find_by_id(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

end
