module ApplicationHelper
  def submit_form_helper(form_type)
    if form_type == "edit"
      '<input class="btn btn-warning" data-disable-with="Update Ad" name="commit" type="submit" value="Update Ad">'.html_safe
    elsif form_type == 'new'
      '<input class="btn btn-success" data-disable-with="Create Ad" name="commit" type="submit" value="Create Ad">'.html_safe
    else
      content_tag(:p, "Not a valid form_type...")
    end
  end
end
