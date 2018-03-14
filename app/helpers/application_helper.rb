module ApplicationHelper
  def form_button_helper(form_type)
    if form_type == "edit"

      ('<input class="btn btn-info" data-disable-with="Update Ad" name="commit" type="submit" value="Update Ad"> | '.html_safe) +
      (link_to "Destroy", @ad, method: :delete, data: { confirm: "Are you sure?" }, class: "btn btn-danger") +
      (' | ').html_safe +
      (link_to "Cancel", @ad, class: "btn btn-light")
    elsif form_type == 'new'
      '<input class="btn btn-success" data-disable-with="Create Ad" name="commit" type="submit" value="Create Ad"> | '.html_safe +
      (link_to "Cancel", '/', class: "btn btn-light")
    elsif form_type == 'show'
      (link_to "Edit", edit_ad_path(@ad), class: "btn btn-info") +
      (' | ').html_safe +
      (link_to "Back", ads_path, class: "btn btn-primary")
    else
      content_tag(:p, "Not a valid form_type...")
    end
  end
end
