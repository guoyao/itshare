class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :details
      t.integer :experience_id

      t.timestamps
    end
  end
end
