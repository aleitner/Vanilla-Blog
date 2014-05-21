class BlogpostsController < ApplicationController
  before_action :set_blogpost, only: [:show, :edit, :update, :destroy]
  # GET /blogposts
  # GET /blogposts.json
  before_filter :authenticate_user!

  include BlogpostsHelper
  
  def index
    @blogposts = Blogpost.all
  end

  # GET /blogposts/1
  # GET /blogposts/1.json
  def show
  end

  def mass_comment_count
    blogposts = Blogpost.all
    blogposts.each do |blogpost|
      comment_counter blogpost.id
    end
  end


  # GET /blogposts/new
  def new
    @blogpost = Blogpost.new
  end

  # GET /blogposts/1/edit
  def edit
  end

  # POST /blogposts
  # POST /blogposts.json
  def create
    @blogpost = Blogpost.new(blogpost_params)

    respond_to do |format|
      @blogpost.user_id = current_user.id
      if @blogpost.save
        @blogpost.save
        format.html { redirect_to @blogpost, notice: 'Blogpost was successfully created.' }
        format.json { render :show, status: :created, location: @blogpost }
      else
        format.html { render :new }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogposts/1
  # PATCH/PUT /blogposts/1.json
  def update
    respond_to do |format|
      if @blogpost.update(blogpost_params)
        format.html { redirect_to @blogpost, notice: 'Blogpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @blogpost }
      else
        format.html { render :edit }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogposts/1
  # DELETE /blogposts/1.json
  def destroy
    @blogpost.destroy

    @comments = Comment.where(blogpost: @blogpost.id)
      @comments.each do |comment|
        comment.destroy
      end

    respond_to do |format|
      format.html { redirect_to dashboard_index_path, notice: 'Blogpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogpost
      @blogpost = Blogpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blogpost_params
      params.require(:blogpost).permit(:content, :comment_id, :user_id, :comment_count)
    end
end
