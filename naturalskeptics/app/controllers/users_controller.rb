class UsersController < ApplicationController

  before_filter :validate_user



  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @cart = current_cart
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def validate_user
    redirect_to root_path unless current_user and current_user.id.to_s == params[:id] or current_user.admin
  end
end