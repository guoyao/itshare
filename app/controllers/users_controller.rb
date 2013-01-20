# encoding: utf-8

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: '恭喜你，注册成功！'
    else
      render action: "new"
    end
  end

end
