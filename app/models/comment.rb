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
  include ApplicationHelper
  attr_accessible :details
  belongs_to :experience
  belongs_to :user

  validates :details, presence: true
  validates :experience_id, presence: true
  validates :user_id, presence: true

  default_scope order: 'comments.created_at DESC'

  self.per_page = 15
end
