class CustomFormBuilder < ActionView::Helpers::FormBuilder
  # To change this template use File | Settings | File Templates.

  def text_field(method, options = {})
    wrap_field(label_for(method, options) + super(method, options), options)
  end

  def password_field(method, options = {})
    wrap_field(label_for(method, options) + super(method, options), options)
  end

  def text_area(method, options = {})
    wrap_field(label_for(method, options) + super(method, options), options)
  end

  def radio_buttons(method, tag_values = [], options = {})
    text = label_for(method, options)
    labels = options.delete(:labels) || []
    options[:checked] = true
    tag_values.each_with_index do |value, index|
      if index > 0
        options[:checked] = value == object[method]
      end
      text.safe_concat(radio_button(method, value, options)).safe_concat(label(labels[index], class: "h-radio-button-label"))
    end
    wrap_field(text, options)
  end

  #def submit(value = nil, options = {})
  #  wrap_field(super.submit(value, options))
  #end

  def label_for(method, options = {})
    label_class = options.delete(:label_class) || 'form-label'
    label = label(options.delete(:label) || method, class: label_class)
    if options[:required]
      required_mark_before_label = options.delete(:required_mark_before_label)
      label = html_wrap(label, '<span class="required-mark">*</span>', required_mark_before_label)
    end
    label.html_safe
  end

  def default_kindeditor_items
    %w(bold italic underline strikethrough removeformat | justifyleft justifycenter justifyright
       formatblock insertorderedlist insertunorderedlist | forecolor hilitecolor fontname fontsize |
       link unlink emoticons code image flash table fullscreen source about)
  end

  def simple_kindeditor_items
    %w(bold italic underline strikethrough removeformat | insertorderedlist insertunorderedlist
       forecolor hilitecolor fontname fontsize | link unlink emoticons code image flash source about)
  end

  private

  def html_wrap(source, target, before=false)
    source.html_safe.sub(/>([^<>]+)</, '>'.concat(before ? target.concat('\1') : '\1'.concat(target)).concat('<'))
  end

  def wrap_field(text, options = {})
    tip_text = ''
    if options[:field_tip]
      tip_text = "<span class='text-success'>#{options.delete(:field_tip)}</span>"
    end
    "<div class='field'>".html_safe.safe_concat(text).safe_concat("#{tip_text}</div>")
  end
end
