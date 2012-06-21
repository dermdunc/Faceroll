module UpdatesHelper
  def hash_link(body)
    h(body).gsub(/#\w+/) { |match| link_to match, search_path(q: match) }.html_safe
  end
end