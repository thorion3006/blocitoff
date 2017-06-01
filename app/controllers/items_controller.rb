class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    if @item.save
    else
      flash[:alert] = 'There was an error saving your item. Please try again.'
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
