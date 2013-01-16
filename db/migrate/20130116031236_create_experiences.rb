class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :title
      t.text :details

      t.timestamps
    end
  end
end
