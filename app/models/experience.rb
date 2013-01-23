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
  include ApplicationHelper
  attr_accessible :company, :details, :title, :keywords, :original, :private, :comment_able

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
  validates :details, presence: true
  validates :user_id, presence: true

  default_scope order: 'experiences.created_at DESC'

  self.per_page = 15

  def comments_count
    comments.count
  end
end
