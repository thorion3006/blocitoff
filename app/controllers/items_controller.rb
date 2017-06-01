class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    if @item.save
      flash[:notice] = 'Item saved successfully.'
    else
      flash.now[:alert] = 'There was an error saving your item. Please try again.'
    end
    redirect_to user_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
