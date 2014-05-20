class AddCommentCountToBlogposts < ActiveRecord::Migration
  def change
    add_column :blogposts, :comment_count, :integer
  end
end
