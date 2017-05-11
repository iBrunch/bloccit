module ApplicationHelper

  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end
  
  def check_admin_or_mod(action)
    if current_user && (current_user.admin? || (current_user.moderator? && (action == 'edit' || action == 'update' || action == 'destroy')))
      true
    end
  end
end
