require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('The Hair Salon Management App', {:type => :feature}) do
  describe('the stylist management path') do
    it('takes the user to the modifiable list of stylists') do
      visit('/')
      click_link('View, add, update and delete stylists')
      expect(page).to have_content('Manage Stylists')
    end
  end
end
