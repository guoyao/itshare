class AddPageviewToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :pageview, :integer, default: 0
  end
end
