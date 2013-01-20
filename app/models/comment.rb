# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  details       :text
#  experience_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :experience
  attr_accessible :details

  #default scope order: 'comments.created_at DESC'
end
