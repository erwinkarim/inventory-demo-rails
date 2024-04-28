class PagesController < ApplicationController
  def index
    render :layout => "application"
  end

  def settings
    @users = User.all()
    @inventoryCount = Inventory.count()

    render :layout => 'application'
  end
end
