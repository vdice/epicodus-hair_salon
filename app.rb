require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pg')
require('./lib/client')
require('./lib/stylist')

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  erb(:index)
end

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

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end
