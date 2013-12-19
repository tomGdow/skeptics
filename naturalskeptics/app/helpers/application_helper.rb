module ApplicationHelper

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end

# Thanks to Agile Web Development by Sam Ruby 4th Edition (Rails 3.2) (p 145) for the above code
