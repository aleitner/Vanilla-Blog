class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  include BlogpostsHelper
  before_filter :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @blogpost_id = @comment.blogpost_id
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @blogpost_id = params[:blogpost_id]
  end

  # GET /comments/1/edit
  def edit
    @blogpost_id = @comment.blogpost_id
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @blogpost_id = params[:blogpost_id]

    respond_to do |format|

    @comment.user_id = current_user.id

      if @comment.save
        comment_counter @comment.blogpost_id
        @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|

      old_id = @comment.blogpost_id

      if @comment.update(comment_params)

        comment_counter old_id
        comment_counter @comment.blogpost_id

        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy

    blogpost_id = @comment.blogpost_id

    @comment.destroy

    comment_counter blogpost_id

    respond_to do |format|
      format.html { redirect_to dashboard_index_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }


    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :blogpost_id, :user_id)
    end
end
