# == Schema Information
#
# Table name: experiences
#
#  id           :integer          not null, primary key
#  company      :string(255)
#  title        :string(255)
#  details      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  original     :integer
#  private      :integer
#  comment_able :integer
#  keywords     :string(255)
#

class Experience < ActiveRecord::Base
  include Aggregation
  attr_accessible :company, :details, :title, :keywords, :original, :private, :comment_able, :pageview

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 24 }
  validates :details, presence: true
  validates :user_id, presence: true

  default_scope order: 'created_at DESC'

  scope :rankings, order: 'pageview DESC'

  self.per_page = 15

  def self.recent_articles(count = 15)
    Experience.limit(count)
  end

  def self.ranking_articles(count = 8)
    Experience.unscoped.rankings.limit(count)
  end

  def self.find_by_id_and_user(id, user)
    experience = nil
    if id > 0 && user then
      experience = Experience.find_by_id_and_user_id(id, user.id)
    end
    experience
  end

  def company?
    company.strip.empty?
  end

end
