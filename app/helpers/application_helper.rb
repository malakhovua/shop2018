module ApplicationHelper
  def old_paginate (current_page, per_page, total_count, method_path)
      result = ''
    if current_page > 1
      result << link_to('<', send(method_path,page: current_page - 1))
      result << link_to('1', send(method_path, page: 1))
      result << '...'
    end


    3.downto(1) do |d|
      next if (current_page - d) < 2
      result << link_to(current_page - d, send(method_path,page: current_page - d))
    end


      result << current_page.to_s
    max_page = (total_count.to_f / per_page).ceil

    3.times do |i|
      d = i + 1
      next if (current_page + d) >= max_page
      result << link_to(current_page + d, send(method_path, page: current_page + d))
    end

    unless total_count <= per_page * current_page

      result << '...'
      result << link_to(max_page, send(method_path, page: max_page))
      result << link_to('>', send(method_path, page: current_page + 1))
    end
    return result.html_safe
  end
end
