module ApplicationHelper
  def markdown_to_html(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end

  def rune_image_url(rune_name)
    path = DataDragonClient.rune_icon_path(rune_name)
    CommunityDragonClient.rune_image_url(path)
  end

  def item_image_url(item_name)
    DataDragonClient.item_image_url_by_name(item_name)
  end
end
