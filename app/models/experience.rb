class Experience < ActiveRecord::Base
  include ApplicationHelper

  attr_accessible :company, :details, :title

end
