require 'spec_helper'

describe "Project pages" do

  subject { page }

  describe "index page" do
    before do
      FactoryGirl.create(:project, title: "Dom", short_desc: "projekt koncepcyjny")
      FactoryGirl.create(:project, title: "Budynek", short_desc: "projekt budowlany")
      visit projects_path
    end

    it { should have_title("projekty") }

    it "should list each user" do
      Project.all.each do |project|
        expect(page).to have_selector('li', text: project.title)
      end
    end
  end

  describe "Project page" do
    let(:project) { FactoryGirl.create(:project) }
    before { visit project_path(project) }

    it { should have_css('div.images_wrapper') }
    it { should have_css('div.project_details') }
    it { should have_title(project.title) }
    it { should have_selector('h2', text: project.title) }
    it { should have_content(project.short_desc) }
    it { should have_content(project.long_desc) }
  end
end