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

require 'spec_helper'

describe Project do

  before { @project = Project.new(title: "Restauracja z hotelem", short_desc: "powierzchnia użytkowa ok. 2 000 m2 stadium: Projekt Koncepcyjny") }

  subject { @project }

  it { should respond_to(:title) }
  it { should respond_to(:short_desc) }
  it { should respond_to(:long_desc) }

  it { should be_valid }

  describe "when name is not present" do
    before { @project.title = "" }
    
    it { should_not be_valid }
  end

  describe "when short description is missing" do
    before { @project.short_desc = "" }

    it { should_not be_valid }
  end

  describe "when title is already taken" do
    before do
      project_with_same_title = @project.dup
      project_with_same_title.title = @project.title.upcase
      project_with_same_title.save
    end

    it { should_not be_valid }
  end
end