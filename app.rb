require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pg')
require('./lib/client')
require('./lib/stylist')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

# Read, Create and Delete Stylists
get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

post('/stylists') do
  name = params.fetch('name')
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()

  @stylists = Stylist.all()
  erb(:stylists)
end

delete('/stylists') do
  Stylist.find(params.fetch('stylist_select').to_i()).delete()

  @stylists = Stylist.all()
  erb(:stylists)
end

# Read, Create and Delete Clients
get('/clients') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:clients)
end

post('/clients') do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_select').to_i()
  stylist = Stylist.find(stylist_id)
  new_client = Client.new({:name => name, :stylist => stylist, :id => nil})
  new_client.save()
  new_client.update({:stylist => stylist})

  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:clients)
end

delete('/clients') do
  Client.find(params.fetch('client_select').to_i()).delete()

  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:clients)
end

# Update Stylists
get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end

# Update Clients
get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  erb(:client)
end
