class CreateJobComments < ActiveRecord::Migration
  def change
    create_table :job_comments do |t|
      t.text :details
      t.integer :job_id

      t.timestamps
    end
  end
end
