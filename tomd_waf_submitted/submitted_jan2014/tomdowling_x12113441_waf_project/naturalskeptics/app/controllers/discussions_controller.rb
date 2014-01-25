class DiscussionsController < ApplicationController

  def index
    @cart = current_cart
    #@discussions = Discussion.all

    @discussions = Discussion.paginate(per_page: 5,
                                       page: params[:page],
                                       order: "title ASC").search(params[:search_query])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end

  def show
    @cart = current_cart
    @discussion = Discussion.find(params[:id])

    @thomas = @discussion.comments.paginate(:per_page => 5,
                                            :page => params[:page],
                                            :order => "created_at DESC").search(params[:search_query])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
    end
  end

  def new
    @discussion = Discussion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def create
    @discussion = Discussion.create(params[:discussion])

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
        format.json { render json: @discussion, status: :created, location: @discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end
end
