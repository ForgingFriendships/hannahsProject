class FriendshipsController < ApplicationController
  skip_before_filter :block_page_if_not_signed_in, :block_page_if_not_admin

  def program
  end

  def events
  end
end
