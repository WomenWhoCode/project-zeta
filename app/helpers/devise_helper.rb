module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty? and flash.empty?

    messages = flash.map{ |key, value| content_tag(:li, value)}.join if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join if flash.empty?
    html = <<-HTML
     <div class="alert-error">
       #{messages}
     </div>
    HTML
    html.html_safe
  end
end