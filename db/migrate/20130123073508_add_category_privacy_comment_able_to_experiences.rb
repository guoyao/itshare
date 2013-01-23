class AddCategoryPrivacyCommentAbleToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :original, :integer # 1 stands for original
    add_column :experiences, :private, :integer # 1 stands for private
    add_column :experiences, :comment_able, :integer # 1 stands for comment_able
  end
end
