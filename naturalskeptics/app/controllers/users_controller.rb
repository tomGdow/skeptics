class UsersController < ApplicationController

  require 'xmlfunctions'

  before_filter :validate_user


  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def indextwo
    #@users = User.all

    @users = User.paginate(per_page: 3,
                                       page: params[:page],
                                       order: "email ASC").search(params[:search_query])



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

  def edit
    @user = User.find(params[:id])
    @cart = current_cart

  end


  def update
    @user = User.find(params[:id])
    @cart = current_cart



    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User detail was successfully updated.' }
        format.json { head :no_content }
        TGD.write_users_to_json
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    TGD.write_users_to_json

    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User has been deleted.'  }
      format.json { head :no_content }
    end
  end

  def validate_user
    redirect_to root_path unless current_user and current_user.id.to_s == params[:id] or current_user.admin
  end
end