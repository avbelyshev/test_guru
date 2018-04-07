module ApplicationHelper
  FLASH_CLASS = {
    error: 'alert alert-danger',
    alert: 'alert alert-warning',
    notice: 'alert alert-info',
    success: 'alert alert-success'
  }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to block_given? ? yield : repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(key)
    FLASH_CLASS[key]
  end

  def flash_messages
    flash.map do |key, message|
      content_tag :div, message, class: flash_class(key.to_sym), role: 'alert'
    end.join.html_safe
  end
end
