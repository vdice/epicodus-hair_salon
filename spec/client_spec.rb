require('spec_helper')

describe(Client) do
  describe('#name') do
    it('returns the name of the client') do
      stylist = Stylist.new({:name => 'Alexander'})
      client = Client.new({:name => 'Bucephalus', :stylist => stylist})
      expect(client.name()).to(eq('Bucephalus'))
    end
  end
end
