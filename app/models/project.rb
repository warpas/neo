# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  short_desc :text
#  long_desc  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :long_desc, :short_desc, :title

  before_save { |project| project.title = title.downcase }

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :short_desc, presence: true
end
