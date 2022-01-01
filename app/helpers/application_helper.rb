module ApplicationHelper
  def error_messages(*objects)
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten

    unless messages.empty?
      content_tag(:div, class: "") do
        list_items = messages.map { |m| content_tag(:li, m) }
        content_tag(:ul, list_items.join.html_safe, class: 'list-unstyled')
      end
    end
  end
end
