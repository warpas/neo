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
#  location   :string(255)
#  imgcode    :string(255)
#

class Project < ActiveRecord::Base
  attr_accessible :long_desc, :short_desc, :title, :location, :imgcode

  before_save { |project|
    project.title = title.squish.mb_chars.downcase
    project.location.squish!
    project.short_desc.squish!
    project.long_desc.squish!
  }
  after_save  { |project|
    final_imgcode = "#{project.location.mb_chars.downcase}-#{project.title.split(' ').first}-#{project.id}"
    if project.imgcode != final_imgcode
      project.imgcode = final_imgcode
      project.save
    end
  }

  validates :title,       presence: true
  validates :short_desc,  presence: true
  validates :location,    presence: true
end
