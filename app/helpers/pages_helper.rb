module PagesHelper
  def link_to_pages(title, link)
    if false
      link_to raw(title), edit_page_path(link), :src => "img/pic_w.png", :style => "left: 1px; position: relative; top: 3px;"
    else
      link_to raw(title), page_path(link), :src => "img/pic_w.png", :style => "left: 1px; position: relative; top: 3px;"
    end
  end
end
