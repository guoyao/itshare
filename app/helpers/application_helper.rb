# encoding: utf-8
module ApplicationHelper

  def new_record_path(for_side_bar = false)
    controller.new_record_path(for_side_bar)
  end

  # use cdn such as qiniu to speed up loading static assets of website
  def add_cdn_path(text, keyword = 'src')
    unless Rails.env.development?
      if keyword == 'src' then
        text = text.gsub(/src\s*=\s*["']\/*([^"']+)["']/, "src=\"#{cloud_root_path}".concat('\1').concat('"')).html_safe
      elsif keyword == 'href' then
        text = text.gsub(/href\s*=\s*["']\/*([^"']+)["']/, "href=\"#{cloud_root_path}".concat('\1').concat('"')).html_safe
      end
    end
    text
  end

  private

  def cloud_root_path
    "http://itshare.qiniudn.com/"
  end

end
