module AdsHelper
  def showAdPublishedStatus(page, ad)
    if page == "poster_filter"
      content_tag :div, :class => "ad-published-status" do
        content_tag :span, ad.published
      end
    end
  end
end
