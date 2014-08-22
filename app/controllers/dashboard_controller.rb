class DashboardController < ApplicationController
	
  def index
    @blogposts = Blogpost.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  	@blogposts_total = Blogpost.all
  end

  def main
  	@blogpost_id = params[:blogpost_id]
    @blogpost = Blogpost.where(id: @blogpost_id)

    @comments = Comment.where(blogpost_id: @blogpost_id)
  end

  def archive
  end

  
end
