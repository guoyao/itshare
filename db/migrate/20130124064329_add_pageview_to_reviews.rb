class AddPageviewToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :pageview, :integer, default: 0
  end
end
