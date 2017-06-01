class RootController < ApplicationController
  def root
    if user_signed_in?
      redirect_to user_path(current_user)
    else
      redirect_to index_path
    end
  end
end
