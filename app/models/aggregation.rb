# encoding: utf-8
module Aggregation
  def created_at_from_now
    time_from_now(created_at)
  end

  def updated_at_from_now
    time_from_now(updated_at)
  end

  def created_at_string(format_string)
    created_at.strftime(format_string)
  end

  def created_at_wday_string
    wday_string(created_at)
  end

  def details_available?(is_current_user = false)
    private? ? is_current_user : true
  end

  def private?
    private == 1
  end

  def comment_able?
    comment_able == 1
  end

  private

  def time_from_now(time)
    result = ""
    now = Time.now
    seconds = now - time
    if seconds < 60 then
      result = "#{seconds.to_i}秒前"
    elsif seconds < 3600 then
      result = "#{(seconds / 60).to_i}分钟前"
    elsif seconds < 86400 then # 3600 * 24
      result = "#{(seconds / 3600).to_i}小时前"
    else
      result = "#{(seconds / 86400).to_i}天前"
    end
    result
  end

  def wday_string(date)
    wdays = [I18n.t('common.monday'), I18n.t('common.tuesday'), I18n.t('common.wednesday'),
             I18n.t('common.thursday'), I18n.t('common.friday'), I18n.t('common.saturday'),
             I18n.t('common.sunday')]
    wdays[date.wday - 1]
  end
end