class CreateReviewComments < ActiveRecord::Migration
  def change
    create_table :review_comments do |t|
      t.text :details
      t.integer :review_id

      t.timestamps
    end
  end
end
