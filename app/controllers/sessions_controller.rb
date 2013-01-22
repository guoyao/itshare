class SessionsController < ApplicationController
  def new
    if signed_in? then
      redirect_to root_path
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to root_path
    else
      flash.now[:error] = t('activerecord.errors.signin')
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
