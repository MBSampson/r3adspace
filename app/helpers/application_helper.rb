module ApplicationHelper
  def form_button_helper(form_type)
    if form_type == "edit"
      (link_to "Cancel", @ad, class: "btn btn-light ad-action-btn") +
      (link_to "Delete Ad", @ad, method: :delete, data: { confirm: "Are you sure?" }, class: "btn btn-danger ad-action-btn") +
      ('<input class="btn btn-info ad-action-btn" data-disable-with="Update Ad" name="commit" type="submit" value="Update Ad">'.html_safe)
    elsif form_type == 'new'
      ('<input class="btn btn-success" data-disable-with="Create Ad" name="commit" type="submit" value="Verify">').html_safe
    elsif form_type == 'show'
      (link_to "Back", ads_path, class: "btn btn-primary ad-action-btn") +
      (link_to "Edit", edit_ad_path(@ad), class: "btn btn-info ad-action-btn")
    else
      content_tag(:p, "Not a valid form_type...")
    end
  end

  def display_nav_items_helper
    if user_signed_in?
      ('<li class="nav-item dropdown"><a class="nav-link" id="ads-dropdown-item" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Ads</a><div class="dropdown-menu" aria-labelledby="navbarDropdown">').html_safe +
      (link_to "Sales", sales_url(:user_id => @user.id), class: 'dropdown-item text-light') +
      (link_to "Ads", ads_poster_filter_path(:poster => @user.id), class: 'dropdown-item text-light') +
      ('</div></li>').html_safe +
      (link_to "Profile", edit_user_registration_path, class: 'nav-link') +
      (link_to "New Ad", new_ad_path, class: 'nav-link') +
      (link_to "Logout", destroy_user_session_path, method: :delete, class: 'nav-link')
    else
      (link_to "Sign Up", new_user_registration_path, class: 'nav-link') +
      (link_to "Login", new_user_session_path, class: 'nav-link')
    end
  end

  def display_nav_brand_image(user)
    if user_signed_in? && user.avatar_file_name != nil
      image_tag user.avatar, class: "nav-brand-img"
    else
      image_tag 'logo-icon.png', class: "nav-brand-img"
    end
  end

end
