module PostsHelper
  def markdown_title
    render_as_markdown title
  end

  def markdown_body
    render_as_markdown title
  end

  def render_as_markdown
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end
end
