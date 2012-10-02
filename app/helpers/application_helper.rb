module ApplicationHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      type = :error if type == :alert
      text = content_tag(:div, link_to("x", "#", :class => "close", "data-dismiss" => "alert") + message, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
   
    flash_messages.join("\n").html_safe
  end

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end
