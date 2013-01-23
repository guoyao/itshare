class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :gender # 0 stands for male, 1 stands for female, -1 stands for secret

      t.timestamps
    end
  end
end
