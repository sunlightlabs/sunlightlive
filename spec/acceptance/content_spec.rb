require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Event content" do

  scenario "Load main page" do
    visit '/'
    page.should have_content("Welcome to Datajam")
  end
end
