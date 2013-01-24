# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_locale, :ranking_articles

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def ranking_articles
    @ranking_experiences = Experience.ranking_articles
    @ranking_reviews = Review.ranking_articles
    @ranking_jobs = Job.ranking_articles
  end

  def new_record_path(for_side_bar = false)
    nil # should be override by subclass
  end

  protected

  def signed_in_user
    redirect_to signin_path, notice: "请登录后再操作！" unless signed_in?
  end
end
