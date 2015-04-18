class HomePageController < ApplicationController
  skip_before_filter :block_page_if_not_signed_in, :block_page_if_not_admin
  def index
    # defaults just renders the page.
  end

  def blog

  end
end
