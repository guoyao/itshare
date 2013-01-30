# encoding: utf-8
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  gender          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  include Aggregation
  attr_accessible :email, :gender, :name, :password, :password_confirmation
  has_secure_password
  has_many :experiences, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :job_comments, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: 'to_user_id', dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: 'from_user_id', dependent: :destroy

  before_save { self.email.downcase! }
  before_save :create_remember_token

  validates :name, presence: true, length: {maximum: 12}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: {minimum: 6}

  validates :password_confirmation, presence: true

  def self.owner
    User.find_by_email('guoyao.rb@gmail.com')
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
