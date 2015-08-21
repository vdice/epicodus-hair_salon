require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('The Hair Salon Management App', {:type => :feature}) do
  describe('the stylist management path') do
    it('takes the user to the modifiable list of stylists, empty at first') do
      visit('/')
      click_link('View, add, update and delete stylists')
      expect(page).to have_content('Manage Stylists')
      expect(page).to have_content('It looks like you don\'t have any stylists!')
    end
    it('takes the user to the modifiable list of clients, empty at first') do
      visit('/')
      click_link('View, add, update and delete clients')
      expect(page).to have_content('Manage Clients')
      expect(page).to have_content('It looks like you don\'t have any clients!')
    end
  end
end
