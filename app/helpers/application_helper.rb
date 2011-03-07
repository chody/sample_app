module ApplicationHelper
  
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
