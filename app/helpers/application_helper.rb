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

  private
    def time_from_now(time)
      result = ""
      now = Time.now
      seconds = now - time
      if seconds < 60 then
        result = "于#{seconds.to_i}秒前"
      elsif seconds < 3600 then
        result = "于#{(seconds / 60).to_i}分钟前"
      elsif seconds < 86400 then  # 3600 * 24
        result = "于#{(seconds / 3600).to_i}小时前"
      else
        result = "于#{(seconds / 86400).to_i}天前"
      end
      result
    end
end
