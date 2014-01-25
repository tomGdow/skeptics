class XmlusersController < ApplicationController

  before_filter :ensure_admin

  def index
       @cart = current_cart
  end

  def show

  end


  def ensure_admin
    unless current_user && current_user.admin?

      redirect_to root_path, :notice => "Only available to administrator"

    end
  end

end


