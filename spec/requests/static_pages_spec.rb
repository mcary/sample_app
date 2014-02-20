require 'spec_helper'

describe "Static pages" do
  subject { page }

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    let(:expected_page_title) do
      "#{base_title}#{" | #{page_title}" if page_title != ''}"
    end
    it { should have_title(expected_page_title) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"

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
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About Us' }
    let(:page_title) { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end
end
