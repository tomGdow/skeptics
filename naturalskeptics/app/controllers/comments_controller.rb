class CommentsController < ApplicationController

  before_filter :ensure_user,  :except => [:index, :show]

  def index
     @cart = current_cart
     @comments = Comment.paginate(:per_page => 7,
                                 :page => params[:page],
                                 :order => "created_at DESC").search(params[:search_query])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  def show
    @comment = Comment.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @discussion = Discussion.find(params[:discussion_id])

    @comment = Comment.new(user_id: current_user.id,
                           text: params[:comment][:text],
                           discussion_id: params[:discussion_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @discussion, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  def ensure_user
    unless current_user.present?
      redirect_to root_path, :notice => "You must be logged in"
    end
  end
end
