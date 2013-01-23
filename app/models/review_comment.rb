# == Schema Information
#
# Table name: review_comments
#
#  id         :integer          not null, primary key
#  details    :text
#  review_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReviewComments < ActiveRecord::Base
  attr_accessible :details, :review_id
end
