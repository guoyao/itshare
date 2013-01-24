class AddUserIdToReviewComments < ActiveRecord::Migration
  def change
    add_column :review_comments, :user_id, :integer
  end
end
