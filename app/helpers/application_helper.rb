module ApplicationHelper
  
  def logo
    #puts logo on main page
   @logo = image_tag("logo.png", :alt => "Sample App", :class => "round") 
  end
  
  def title
    #Returns title on a per page basis.
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title 
    else
      "#{base_title} | #{@title}"
    end
  end
end
