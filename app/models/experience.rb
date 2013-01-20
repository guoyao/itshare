# == Schema Information
#
# Table name: experiences
#
#  id         :integer          not null, primary key
#  company    :string(255)
#  title      :string(255)
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Experience < ActiveRecord::Base
  include ApplicationHelper

  has_many :comments, :dependent => :destroy

  attr_accessible :company, :details, :title

  def comments_count
    comments.count
  end
end
