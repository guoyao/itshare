class AddUserIdToJobComments < ActiveRecord::Migration
  def change
    add_column :job_comments, :user_id, :integer
  end
end
