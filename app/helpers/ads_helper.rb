module AdsHelper
  def show_ad_published_status(page, ad)
    if user_signed_in? && current_user.id == ad.user_id
      if page == "poster_filter"
        content_tag :div, :class => "ad-published-status" do
          content_tag :span, ad.published
        end
      end
    end
  end

  def display_published_toggle_btns(ad)
    if user_signed_in?
      if current_user.id == ad.user_id
        if ad.published == "draft"
          link_to "Post", toggle_published_ad_path(ad.id), class: "btn btn-success"
        else
          link_to "Hide", toggle_published_ad_path(ad.id), class: "btn btn-danger"
        end
      end
    end
  end

  def display_edit_btns(ad)
    if user_signed_in?
      if current_user.id == ad.user_id
        form_button_helper(@form_type)
      end
    end
  end

  def allow_ad_edit(ad)
    if current_user.id != ad.user_id
      content_tag :div, :class => "no-content-container" do
        content_tag :h2, "You do not have permission to edit this ad."
      end
    else
      render 'form', ad: ad
    end
  end

end
