class AddUserIdToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :user_id, :integer
    add_index :experiences, [:user_id, :created_at]
  end
end
