require('rspec')
require('client')
require('stylist')
require('pg')

DB = PG.connect({:dbname => "hair_salon_test"})

RSpec.configure do |config|
  config.before(:each) do
    # Wipe DB
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")

    # Verify DB state
    expect(Client.all()).to(eq([]))
    expect(Stylist.all()).to(eq([]))

    # Initialize test instances
    @stylist = Stylist.new({:name => 'Alexander', :id => nil})
    @client = Client.new({:name => 'Bucephalus', :stylist => @stylist, :id => nil})

    @alternate_stylist = Stylist.new({:name => 'Philonicus the Thessalian', :id => nil})
    @alternate_client = Client.new({:name => 'Buce', :stylist => @alternate_stylist, :id => nil})
  end
end
