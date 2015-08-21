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
    it('presents the user with a listing of all stylists') do
      @stylist.save()
      visit('/stylists')
      expect(page).to have_content(@stylist.name())
    end
    it('allows the user to visit a particular stylist page') do
      @stylist.save()
      visit('/stylists')
      click_link(@stylist.name())
      expect(page).to have_content("Manage clients for #{@stylist.name()}")
    end
    it('allows the user to add a new stylist') do
      visit('/stylists')
      fill_in('name', :with => 'King Philip II')
      click_button('Add Stylist')
      expect(page).to have_content('King Philip II')
    end
  end

  describe('the client management path') do
    it('takes the user to the modifiable list of clients, empty at first') do
      visit('/')
      click_link('View, add, update and delete clients')
      expect(page).to have_content('Manage Clients')
      expect(page).to have_content('It looks like you don\'t have any clients!')
    end
    it('presents the user with a listing of all clients, along with their stylists') do
      @stylist.save()
      @client.save()
      visit('/clients')
      expect(page).to have_content(@client.name())
      expect(page).to have_content(@stylist.name())
    end
    it('does not allow the user to add a client without a stylist') do
      visit('/clients')
      expect(page).to have_content('It looks like you don\'t have any clients!')
      expect(page).to have_content('You\'ll have to Add a stylist before adding any clients!')
    end
    it('allows the user to add a new client') do
      @stylist.save()
      visit('/clients')
      fill_in('name', :with => 'Balios')
      find('#stylist_select').find(:xpath, 'option[1]').select_option
      click_button('Add Client')
      expect(page).to have_content('Balios')
      expect(page).to have_content(@stylist.name())
    end
  end
end
