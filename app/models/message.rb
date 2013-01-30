class Message < ActiveRecord::Base
  include Aggregation
  attr_accessible :from_user, :to_user, :details

  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'

  validates :from_user_id, presence: true
  validates :to_user_id, presence: true

  default_scope order: 'created_at DESC'
end