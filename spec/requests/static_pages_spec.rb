require 'spec_helper'

describe "Static pages" do
  before { visit root_path }
  subject { page }

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do

    it { should have_content('Sample App') }
    it { should have_title("Ruby on Rails Tutorial Sample App") }

    it "should not have a custom page title" do
      should_not have_title('| Home')
      should_not have_title('|')
    end

    it "should have layout links" do # extra spec
      should have_link("Home", href: "/")
      should have_link("Help", href: "/help")
      should have_link("About", href: "/about")
      should have_link("Contact", href: "/contact")
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title("#{base_title} | Help") }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About Us') }
    it { should have_title("#{base_title} | About Us") }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title("#{base_title} | Contact") }
  end
end
