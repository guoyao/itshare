class CustomFormBuilder < ActionView::Helpers::FormBuilder
  # To change this template use File | Settings | File Templates.

  def text_field(method, options = {})
    wrap_field(label_for(method, options) + super(method, options))
  end

  def password_field(method, options = {})
    wrap_field(label_for(method, options) + super(method, options))
  end

  def text_area(method, options = {})
    wrap_field(label_for(method, options) + super(method, options))
  end

  def radio_buttons(method, tag_values = [], options = {})
    text = label_for(method, options)
    labels = options.delete(:labels) || []
    tag_values.each_with_index do |value, index|
      text.safe_concat(radio_button(method, value, options)).safe_concat(label(labels[index], class: "common-label"))
    end
    wrap_field(text)
  end

  #def submit(value = nil, options = {})
  #  wrap_field(super.submit(value, options))
  #end

  private

  def label_for(method, options = {})
    label_class = options.delete(:label_class) || 'form-label'
    label = label(options.delete(:label) || method, class: label_class)
    if options[:required]
      label = html_wrap(label, '<span class="required-mark">*</span>')
    end
    label.html_safe
  end

  def html_wrap(source, target, before=true)
    source.html_safe.sub(/>([^<>]+)</, '>'.concat(before ? target.concat('\1') : '\1'.concat(target)).concat('<'))
  end

  def wrap_field(text)
    "<div class='field'>".html_safe.safe_concat(text).safe_concat("</div>")
  end
end