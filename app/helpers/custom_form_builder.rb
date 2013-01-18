class CustomFormBuilder < ActionView::Helpers::FormBuilder
  # To change this template use File | Settings | File Templates.

  def text_field(method, options = {})
    label_for(method, options) + super(method, options)
  end

  def text_area(method, options = {})
    label_for(method, options) + super(method, options)
  end

  private

  def label_for(method, options = {})
    label = label(options.delete(:label) || method)
  end
end