module ApplicationHelper
  def my_name
    "Teenum"
  end

  def form_group_tag(errors, &block)

    # Depending on whether ther errors array contains any weeoes, the content_tag method is called
    # The form content_tag method builds the HTML to display the form element & its associated errors

    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def vote_link_classes(post, direction)
    if (current_user.voted(post) && current_user.voted(post).up_vote?) || (current_user.voted(post) && current_user.voted(post).down_vote?).first
      "glyphicon glyphicon-chevron-#{direction} disabled"
    else
      "glyphicon glyphicon-chevron-#{direction}"
    end
  end

end
