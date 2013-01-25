# == Schema Information
#
# Table name: jobs
#
#  id           :integer          not null, primary key
#  company      :string(255)
#  title        :string(255)
#  details      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  original     :integer
#  private      :integer
#  comment_able :integer
#  keywords     :string(255)
#  user_id      :integer
#

class Job < ActiveRecord::Base
  include Aggregation
  attr_accessible :company, :details, :title, :keywords, :original, :private, :comment_able, :pageview

  belongs_to :user
  has_many :job_comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 24 }
  validates :details, presence: true
  validates :user_id, presence: true

  default_scope order: 'created_at DESC'

  scope :rankings, order: 'pageview DESC'

  self.per_page = 15

  def self.recent_articles(count = 15)
    Job.limit(count)
  end

  def self.ranking_articles(count = 8)
    Job.unscoped.rankings.limit(count)
  end

  def company?
    company.strip.empty?
  end

end
