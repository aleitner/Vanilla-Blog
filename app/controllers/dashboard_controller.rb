class DashboardController < ApplicationController
	
  def index
  	@blogposts = Blogpost.order('created_at DESC').all
  end

  def main
  	@blogpost_id = params[:blogpost_id]
    @blogpost = Blogpost.where(id: @blogpost_id)
    @comments = Comment.where(blogpost_id: @blogpost_id)
  end
end
