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
      if current_user.id == ad.user_id && ad.sold != true
        if ad.published == "draft"
          link_to "Post", toggle_published_ad_path(ad.id), class: "btn btn-success ad-action-btn float-right"
        else
          link_to "Hide", toggle_published_ad_path(ad.id), class: "btn btn-danger ad-action-btn float-right"
        end
      elsif current_user.id == ad.user_id && ad.sold == true
        link_to "Delete Ad", @ad, method: :delete, data: { confirm: "Are you sure?" }, class: "btn btn-danger ad-action-btn float-right"
      end
    end
  end

  def display_edit_btns(ad)
    if user_signed_in?
      if current_user.id == ad.user_id && ad.sold != true
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

  def show_purchase_container(ad)
    # Displays a Buy button that redirects users and non-users to different controller actions
    if user_signed_in?
      if current_user.id != ad.user_id
        ("<span class='ad-quantity-text'>Qty: #{ad.quantity}</span>").html_safe +
        (link_to "Buy", new_order_path(:ad_id => ad.id ), class: "btn btn-success buy-btn")
      end
    else
      ("<span class='ad-quantity-text'>Qty: #{ad.quantity}</span>").html_safe +
      (link_to "Buy", ads_buy_ad_url(:ad_id => ad.id), class: "btn btn-success buy-btn")
    end
  end

end
