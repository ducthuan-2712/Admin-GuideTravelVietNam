module ApplicationHelper

  def current_class?(test_path)
    return 'mdc-list-item--activated' if request.path == test_path
    ''
  end

  def current_url(new_params)
    url_for params.merge(new_params)
  end

end
