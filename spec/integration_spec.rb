require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('The Hair Salon Management App', {:type => :feature}) do
  describe('the stylist management path') do

    describe('inital state') do
      it('takes the user to the modifiable list of stylists, empty at first') do
        visit('/')
        click_link('View, add, update and delete stylists')
        expect(page).to have_content('Manage Stylists')
        expect(page).to have_content('It looks like you don\'t have any stylists!')
        expect(page).to_not have_content('Remove a Stylist')
      end
    end

    describe('create, read, delete stylists') do
      before(:each) do
        @stylist.save()
        visit('/stylists')
      end

      it('presents the user with a listing of all stylists') do
        expect(page).to have_content(@stylist.name())
      end
      it('allows the user to visit a particular stylist page') do
        click_link(@stylist.name())
        expect(page).to have_content("Manage clients for #{@stylist.name()}")
      end
      it('allows the user to add a new stylist') do
        fill_in('name', :with => 'King Philip II')
        click_button('Add Stylist')
        expect(page).to have_content('King Philip II')
      end
      it('allows the user to remove a stylist') do
        find('#stylist_select').find(:xpath, 'option[1]').select_option
        click_button('Remove Stylist')
        expect(page).to have_content('It looks like you don\'t have any stylists!')
      end
    end
  end

  describe('the client management path') do

    describe('initial state') do
      it('takes the user to the modifiable list of clients, empty at first') do
        visit('/')
        click_link('View, add, update and delete clients')
        expect(page).to have_content('Manage Clients')
        expect(page).to have_content('It looks like you don\'t have any clients!')
        expect(page).to_not have_content('Remove a Client')
      end
      it('does not allow the user to add a client without a stylist') do
        visit('/clients')
        expect(page).to have_content('You\'ll have to Add a stylist before adding any clients!')
      end
    end

    describe('create, read and delete clients') do
      before(:each) do
        @stylist.save()
        @client.save()
        visit('/clients')
      end

      it('presents the user with a listing of all clients, along with their stylists') do
        expect(page).to have_content(@client.name())
        expect(page).to have_content(@stylist.name())
      end
      it('allows the user to add a new client') do
        fill_in('name', :with => 'Balios')
        find('#stylist_select').find(:xpath, 'option[1]').select_option
        click_button('Add Client')
        expect(page).to have_content('Balios')
        expect(page).to have_content(@stylist.name())
      end
      it('allows the user to remove a client') do
        find('#client_select').find(:xpath, 'option[1]').select_option
        click_button('Remove Client')
        expect(page).to have_content('It looks like you don\'t have any clients!')
      end
    end
  end

  describe('the unique client path') do
    before(:each) do
      @stylist.save()
      @client.save()
      @client.update({:stylist => @stylist})
      visit("/clients/#{@client.id()}")
    end

    it('greets the user with initial details') do
      expect(page).to have_content("Manage details for #{@client.name()}")
      expect(page).to have_content("Current Stylist is #{@client.stylist().name()}")
    end

    it('allows the user to change name and change stylist') do
      # @alternate_stylist.save()
      # fill_in('name', :with => @alternate_client.name())
      # find('#client_select').find(:xpath, 'option[2]').select_option
      # click_button('Update')
      # expect(page).to have_content(@alternate_client.name())
      # expect(page).to have_content(@alternate_stylist.name())
    end
    it('allows the user to change name only') do

    end
    it('allows the user to add clients only') do

    end
  end

  describe('the unique stylist path') do
    describe('initial state') do

    end
    describe('allows the user to update a stylist') do
      it('can change name and add clients') do

      end
      it('can change name only') do

      end
      it('can add clients only') do

      end
    end
  end
end
