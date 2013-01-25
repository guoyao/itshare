# == Schema Information
#
# Table name: job_comments
#
#  id         :integer          not null, primary key
#  details    :text
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class JobComment < ActiveRecord::Base
  include Aggregation
  attr_accessible :details
  belongs_to :job
  belongs_to :user

  validates :details, presence: true
  validates :job_id, presence: true
  validates :user_id, presence: true

  default_scope order: 'job_comments.created_at DESC'

  self.per_page = 15
end
