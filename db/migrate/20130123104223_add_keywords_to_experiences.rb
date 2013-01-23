class AddKeywordsToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :keywords, :string
  end
end
