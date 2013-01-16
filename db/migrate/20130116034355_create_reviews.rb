class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :company
      t.string :title
      t.text :details

      t.timestamps
    end
  end
end
