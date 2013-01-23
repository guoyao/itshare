class AddOriginalPrivateCommentAbleKeywordsUserIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :original, :integer # 1 stands for original
    add_column :jobs, :private, :integer # 1 stands for private
    add_column :jobs, :comment_able, :integer # 1 stands for comment_able
    add_column :jobs, :keywords, :string
    add_column :jobs, :user_id, :integer
    add_index :jobs, [:user_id, :created_at]
  end
end
