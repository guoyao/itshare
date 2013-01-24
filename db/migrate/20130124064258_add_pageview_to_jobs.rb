class AddPageviewToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :pageview, :integer, default: 0
  end
end
