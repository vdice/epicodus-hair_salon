require('spec_helper')

describe(Client) do
  before() do
    @stylist = Stylist.new({:name => 'Alexander'})
    @client = Client.new({:name => 'Bucephalus', :stylist => @stylist})

    @stylist.save()
    @client.save()
  end
  
  describe('#name') do
    it('returns the name of the client') do
      expect(@client.name()).to(eq('Bucephalus'))
    end
  end

  describe('#id') do
    it('returns the id of the client') do
      expect(@client.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
