class HomeController < ApplicationController

  def index
    @cart = current_cart
  end

  def mygems
    @cart =current_cart
    render :layout => false
  end

  def new
    @cart = current_cart

    respond_to do |format|
      format.js
    end
  end

  def show
    @cart = current_cart
  end
end
