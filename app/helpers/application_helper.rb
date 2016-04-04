module ApplicationHelper

  def full_title(page_title = '', base_title = 'Malinuse')
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def login_options
    @redirect_path ? {redirect_to: @redirect_path} : {}
  end

end
