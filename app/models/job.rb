# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  company    :string(255)
#  title      :string(255)
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Job < ActiveRecord::Base
  attr_accessible :company, :details, :title
end
