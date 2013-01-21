class CustomFormBuilder < ActionView::Helpers::FormBuilder
  # To change this template use File | Settings | File Templates.

  def text_field(method, options = {})
    wrap_field(label_for(method, options) + super(method, options),options)
  end

  def password_field(method, options = {})
    wrap_field(label_for(method, options) + super(method, options),options)
  end

  def text_area(method, options = {})
    wrap_field(label_for(method, options) + super(method, options),options)
  end

  private

  def label_for(method, options = {})
    label = label(options.delete(:label) || method)
    if options[:required]
      label = html_wrap(label, '<span class="required-mark">*</span>')
    end
    label.html_safe
  end

  def html_wrap(source, target, before=true)
    source.html_safe.sub(/>([^<>]+)</, '>'.concat(before ? target.concat('\1') : '\1'.concat(target)).concat('<'))
  end

  def wrap_field(text, options={})
    "<div class='field'>".html_safe.safe_concat(text).safe_concat("</div>")
  end
end