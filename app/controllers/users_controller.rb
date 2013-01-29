# encoding: utf-8

class UsersController < ApplicationController
  include UsersHelper

  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    render :layout => 'user_space'
  end

  def new
    if signed_in? then
      redirect_to root_path
    end
    @user = User.new
    if flash[:email_from_openid] then
      @user.email = flash[:email_from_openid]
      @user.name = @user.email.gsub(/([^@]+)@.+/,'\1')[0..11]
      flash[:email_from_openid] = @user.email
    end
  end

  def edit
    @user = User.find(params[:id])
    render :layout => 'user_space'
  end

  def create
    @user = User.new(params[:user])
    if flash[:email_from_openid] then
      @user.password = @user.password_confirmation = newpass(6)
    end
    if @user.save
      #message = Message.new
      #message.from_user = User.find_by_email('guoyao.rb@gmail.com')
      #message.to_user = @user
      #message.details = "#{@user.name}您好，您已经成为IT Share会员，您的登录账号是#{@user.email}，初始密码是#{@user.password}，请即时修改密码和完善个人资料，我们倡议：所有IT Share的会员使用真实头像。感谢您对IT Share的支持。"
      #message.save
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
