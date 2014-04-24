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

require 'spec_helper'

describe Project do

  before { @project = Project.new(title: "Restauracja z hotelem", short_desc: "powierzchnia użytkowa ok. 2 000 m2 stadium: Projekt Koncepcyjny",
    location: "Wrocław", imgcode: "wrocław-restauracja-53") }

  subject { @project }

  it { should respond_to(:title) }
  it { should respond_to(:short_desc) }
  it { should respond_to(:long_desc) }
  it { should respond_to(:location) }
  it { should respond_to(:imgcode) }

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

    it { should be_valid }
  end

  describe "when location is missing" do
    before { @project.location = "" }

    it { should_not be_valid }
  end

  describe "when imgcode is missing" do
    before { @project.imgcode = "" }

    it { should_not be_valid }
  end

  describe "when imgcode isn't right" do
    before { @project.imgcode = "wrongcode" }

    it { should_not be_valid }
  end

  describe "when imgcode is correct" do
    before do
    end
  end
end
