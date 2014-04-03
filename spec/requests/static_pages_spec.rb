require 'spec_helper'

describe "Static pages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    let(:page_title) { '' }

    before { visit root_path }

    it { should have_title('neodesign') }
    it { should_not have_title('| Home') }
    it { should_not have_selector('h1')}

    describe "Logo" do

      it { should have_selector('img') }
      it { should have_link('Logo Neodesign', href: root_path) }
    end
  end

  describe "About page" do
    let(:page_title) { 'O nas' }
    
    before { visit neodesign_path }

    it { should_not have_title('| About') }
    it { should have_css('div#boss') }
    it { should have_css('div#organization') }
    it { should have_css('div#people_wrapper') }
    it { should have_link("neodesign@neodesign.wroc.pl",
                          href: "mailto:neodesign@neodesign.wroc.pl") }
  end

  describe "Contact page" do
    let(:page_title) { 'Kontakt' }
    
    before { visit contact_path }

    it { should_not have_title('| Contact') }
    it { should have_content('contact') }
  end
end
