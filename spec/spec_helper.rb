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

    # Initialize test instances
    @stylist = Stylist.new({:name => 'Alexander', :id => nil})
    @client = Client.new({:name => 'Bucephalus', :stylist => @stylist, :id => nil})

    # Save to DB
    @stylist.save()
    @client.save()
  end
end
