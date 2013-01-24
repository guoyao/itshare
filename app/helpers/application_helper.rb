# encoding: utf-8
module ApplicationHelper
  def created_at_from_now
    time_from_now(created_at)
  end

  def updated_at_from_now
    time_from_now(updated_at)
  end

  def new_record_path(for_side_bar = false)
    controller.new_record_path(for_side_bar)
  end

  # use cdn such qiniu to speed up website
  def add_cdn_path(text, keyword = 'src')
    if keyword == 'src' then
      text = text.gsub(/src\s*=\s*["']\/*([^"']+)["']/, "src=\"#{cloud_root_path}".concat('\1').concat('"')).html_safe
    elsif keyword == 'href' then
      text = text.gsub(/href\s*=\s*["']\/*([^"']+)["']/, "href=\"#{cloud_root_path}".concat('\1').concat('"')).html_safe
    end
    text
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
      elsif seconds < 86400 then  # 3600 * 24
        result = "#{(seconds / 3600).to_i}小时前"
      else
        result = "#{(seconds / 86400).to_i}天前"
      end
      result
    end

    def cloud_root_path
      "http://itshare.qiniudn.com/"
    end
end
