# == Schema Information
#
# Table name: reviews
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

class Review < ActiveRecord::Base
  include Aggregation
  attr_accessible :company, :details, :title, :keywords, :original, :private, :comment_able, :pageview

  belongs_to :user
  has_many :review_comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 24 }
  validates :details, presence: true
  validates :user_id, presence: true

  default_scope order: 'created_at DESC'

  scope :rankings, order: 'pageview DESC'

  self.per_page = 15

  def self.recent_articles(count = 15)
    Review.limit(count)
  end

  def self.ranking_articles(count = 8)
    Review.unscoped.rankings.limit(count)
  end

  def self.find_by_id_and_user(id, user)
    review = nil
    if id > 0 && user then
      review = Review.find_by_id_and_user_id(id, user.id)
    end
    review
  end

  def company?
    company.strip.empty?
  end

end
