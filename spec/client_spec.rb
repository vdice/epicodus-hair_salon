require('spec_helper')

describe(Client) do
  describe('#name') do
    it('returns the client\'s name') do
      expect(@client.name()).to(eq('Bucephalus'))
    end
  end

  describe('#id') do
    it('returns the client\'s id') do
      expect(@client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#stylist') do
    it('returns the client\'s stylist') do
      expect(@client.stylist()).to(eq(@stylist))
    end
  end

  describe('.all') do
    it('returns all clients') do
      expect(Client.all()).to(eq([@client]))
    end
  end
end
