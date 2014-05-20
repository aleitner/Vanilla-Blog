module BlogpostsHelper

		def comment_counter blogpost_id
		
		blogpost = Blogpost.find(blogpost_id)

		num_comments = Blogpost.find(blogpost_id).comments.count

		blogpost.comment_count = num_comments

		blogpost.save

	end
	
end
