class AddOriginalPrivateCommentAbleKeywordsUserIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :original, :integer # 1 stands for original
    add_column :reviews, :private, :integer # 1 stands for private
    add_column :reviews, :comment_able, :integer # 1 stands for comment_able
    add_column :reviews, :keywords, :string
    add_column :reviews, :user_id, :integer
    add_index :reviews, [:user_id, :created_at]
  end
end
